from create_github_gist import create_github_gist
from run_python_blocks_from_gist import run_python_blocks_from_gist


def main():
    print("Hello from 11!")


if __name__ == "__main__":
    main()

    file_name = "zen.md"

    file_content = """
# The Zen of Python

```python
import this
```

"""
    description = "Zen"
    print("`create_github_gist(file_name, file_content, description)`")
    id = create_github_gist(file_name, file_content, description)
    print(f"[gist](https://gist.github.com/{id})\n")
    print(f"`run_python_blocks_from_gist({id})`\n")
    run_python_blocks_from_gist(id)
