import requests
import json
import os

# Get your PAT from an environment variable for security
GITHUB_TOKEN = os.environ.get("GITHUB_TOKEN")
if not GITHUB_TOKEN:
    raise ValueError("GITHUB_TOKEN environment variable not set")


def create_github_gist(file_name, content, description):
    """Creates a GitHub Gist using the requests library."""
    url = "https://api.github.com/gists"
    headers = {
        "Authorization": f"token {GITHUB_TOKEN}",
        "Accept": "application/vnd.github+json",
    }
    data = {
        "description": description,
        "public": False,
        "files": {file_name: {"content": content}},
    }

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 201:
        # gist_url = response.json().get("html_url")
        # print(f"Successfully created Gist: {gist_url}")
        # return gist_url
        id = response.json().get("id")
        return id
    else:
        print(f"Failed to create Gist. Status code: {response.status_code}")
        print(response.json())
        return None


# Example usage:

if __name__ == "__main__":
    file_name = "zen.md"

    file_content = """
# The Zen of Python

We define a function `hello`

```python
import this
```

"""
    description = "Zen"
    id = create_github_gist(file_name, file_content, description)
    print(id)
