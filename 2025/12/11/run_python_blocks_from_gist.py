import regex as re
import requests
import json
import sys


def extract_python_blocks(md_text: str) -> list[str]:
    """
    Return a list of Python code blocks found in the Markdown string.
    """
    pattern = r"```python\s*(.*?)\s*```"
    # DOTALL makes `.` match newlines
    return re.findall(pattern, md_text, flags=re.DOTALL)


def run_python_blocks(python_blocks: list[str]):
    for code in python_blocks:
        exec(code, globals())


def run_python_blocks_from_gist(id):
    url = f"https://api.github.com/gists/{id}"
    data = json.loads(requests.get(url).text)
    files = data["files"]
    for file in files:
        md_text = files[file]["content"]
        print(f"`{file}`")
        print(md_text)
        print("## output")
        print("```")
        run_python_blocks(extract_python_blocks(md_text))
        print("```")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        run_python_blocks_from_gist(sys.argv[1])
    else:
        run_python_blocks_from_gist("e42e15b3604eab5dd2728b7d84d71fa5")
