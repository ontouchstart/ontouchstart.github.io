import json
import os
import requests
import sys

from mlx_lm import generate, load
from mlx_lm.models.cache import make_prompt_cache
from bs4 import BeautifulSoup
from typing import Dict, List

checkpoint = "mlx-community/Qwen2.5-7b-Instruct-4bit"

# Load the corresponding model and tokenizer
model, tokenizer = load(path_or_hf_repo=checkpoint)
max_tokens = 4096


# ------------------------------------------------------------------
# 1.  Gist body
# ------------------------------------------------------------------
def extract_gist_body(soup: BeautifulSoup) -> Dict[str, str]:
    """
    Return a mapping *file_name → plain‑text content* for every file that
    appears in the Gist page.

    Parameters
    ----------
    soup : BeautifulSoup
        The parsed HTML of a GitHub Gist page.

    Returns
    -------
    dict
        Example: {"hello.c": '#include <stdio>\nint main(){...}\n'}
    """
    files: Dict[str, str] = {}

    # Every file is wrapped in a <div class="file …">.
    for file_div in soup.find_all("div", class_="file"):
        # The file name link (e.g. <a class="wb-break-all">hello.c</a>)
        name_tag = file_div.find("a", class_="wb-break-all")
        if not name_tag:
            continue
        file_name = name_tag.get_text(strip=True)

        # The code is inside a <table class="highlight"> → <tr> → <td class="blob-code">
        table = file_div.find("table", class_="highlight")
        if not table:
            content = ""
        else:
            lines: List[str] = []
            for tr in table.find_all("tr"):
                code_td = tr.find("td", class_="blob-code")
                if code_td:
                    # Preserve whitespace exactly as it appears in the page.
                    lines.append(code_td.get_text("\n", strip=False))
            content = "\n".join(lines)

        files[file_name] = content

    return files


# ------------------------------------------------------------------
# 2.  Gist comments
# ------------------------------------------------------------------
def extract_gist_comments(soup: BeautifulSoup) -> List[Dict[str, str]]:
    """
    Return a list of comment dictionaries extracted from the Gist page.

    Each dictionary contains:
        - author   : comment author's GitHub username
        - timestamp: ISO‑8601 datetime string
        - body     : raw markdown of the comment

    Parameters
    ----------
    soup : BeautifulSoup
        The parsed HTML of a GitHub Gist page.

    Returns
    -------
    list[dict]
    """
    comments: List[Dict[str, str]] = []

    # Every comment lives inside <div class="js-comment-container">.
    for comment in soup.find_all("div", class_="js-comment-container"):
        # Author
        author_tag = comment.find("a", class_="author")
        author = author_tag.get_text(strip=True) if author_tag else ""

        # Timestamp (the <relative-time> element)
        time_tag = comment.find("relative-time")
        timestamp = (
            time_tag["datetime"] if time_tag and time_tag.has_attr("datetime") else ""
        )

        # Body – the markdown inside <div class="comment-body …">
        body_tag = comment.find("div", class_="comment-body")
        body = body_tag.get_text("\n", strip=True) if body_tag else ""

        comments.append(
            {
                "author": author,
                "timestamp": timestamp,
                "body": body,
            }
        )

    return comments


def gist(id: str):
    """
    A function that returns the body and comments of the gist

    Args:
        id: id of the gist
    """
    url = f"https://gist.github.com/{id}"
    text = requests.get(url).text
    print("gist")
    print(url)
    print(text)
    soup = BeautifulSoup(text, "html.parser")
    print(soup)
    body = extract_gist_body(soup)
    print(body)
    comments = extract_gist_comments(soup)
    print(comments)
    data = {"body": body, "comments": comments}
    return json.dumps(data)


tools = {"gist": gist}


def gist_review(id: str):
    prompt = f"Review and print the files in gist {id}, including markdown files. If the gist has comments, list the comments and authors."
    messages = [{"role": "user", "content": prompt}]

    prompt = tokenizer.apply_chat_template(
        messages, add_generation_prompt=True, tools=list(tools.values())
    )
    prompt_cache = make_prompt_cache(model)

    # Generate the initial tool call:
    response = generate(
        model=model,
        tokenizer=tokenizer,
        prompt=prompt,
        max_tokens=max_tokens,
        verbose=True,
        prompt_cache=prompt_cache,
    )

    # Parse the tool call:
    tool_open = "<tool_call>"
    tool_close = "</tool_call>"
    start_tool = response.find(tool_open) + len(tool_open)
    end_tool = response.find(tool_close)
    tool_call = json.loads(response[start_tool:end_tool].strip())
    tool_result = tools[tool_call["name"]](**tool_call["arguments"])

    # Put the tool result in the prompt
    messages = [{"role": "tool", "name": tool_call["name"], "content": tool_result}]
    prompt = tokenizer.apply_chat_template(
        messages,
        add_generation_prompt=True,
    )

    # Generate the final response:
    return generate(
        model=model,
        tokenizer=tokenizer,
        prompt=prompt,
        max_tokens=max_tokens,
        verbose=True,
        prompt_cache=prompt_cache,
    )


if __name__ == "__main__":
    if len(sys.argv) > 1:
        id = sys.argv[1]
    else:
        id = "awni/ab251213217adf3798d1b6852bbd9d01"
    source = f"https://gist.github.com/{id}\n\n"
    content = source + gist_review(id)
    GITHUB_TOKEN = os.environ.get("GITHUB_TOKEN")
    url = "https://api.github.com/gists"
    headers = {
        "Authorization": f"token {GITHUB_TOKEN}",
        "Accept": "application/vnd.github+json",
    }
    data = {
        "description": f"gist_review for {id}",
        "public": False,
        "files": {"Review.md": {"content": content}},
    }
    print(headers)

    print(json.dumps(data))

    response = requests.post(url, headers=headers, data=json.dumps(data))
    print(response)
