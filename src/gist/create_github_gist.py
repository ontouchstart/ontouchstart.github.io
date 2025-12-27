import requests
import json
import os

# Get your PAT from an environment variable for security
GITHUB_TOKEN = os.environ.get("GITHUB_TOKEN")
if not GITHUB_TOKEN:
    raise ValueError("GITHUB_TOKEN environment variable not set")


def create_github_gist(file_name, content):
    """Creates a GitHub Gist using the requests library."""
    url = "https://api.github.com/gists"
    headers = {
        "Authorization": f"token {GITHUB_TOKEN}",
        "Accept": "application/vnd.github+json",
    }
    data = {
        "description": file_name,
        "public": False,
        "files": {file_name: {"content": content}},
    }

    response = requests.post(url, headers=headers, data=json.dumps(data))

    if response.status_code == 201:
        id = response.json().get("id")
        return id
    else:
        print(f"Failed to create Gist. Status code: {response.status_code}")
        print(response.json())
        return None


if __name__ == "__main__":
    print(
        f"https://gist.github.com/{create_github_gist('ontouchstart.md', '# ontouchstart')}"
    )
