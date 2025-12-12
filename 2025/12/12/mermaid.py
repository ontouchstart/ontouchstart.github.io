from create_github_gist import create_github_gist


def mermaid():
    file_name = "mermaid.md"

    content = """
# mermaid

Here is a simple flow chart:

```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
"""

    return create_github_gist(file_name, content)


if __name__ == "__main__":
    print(f"[gist](https://gist.github.com/{mermaid()})")
