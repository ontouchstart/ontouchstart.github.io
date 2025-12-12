from create_github_gist import create_github_gist
from run_python_blocks_from_gist import run_python_blocks_from_gist


file_name = "zen.md"

file_content = """
# The Zen of Python

```python
import this
```

"""

description = "Zen"
print("`create_github_gist(file_name, file_content, description)`\n\n")
id = create_github_gist(file_name, file_content, description)
print(f"[gist](https://gist.github.com/{id})\n\n")
print(f"`run_python_blocks_from_gist({id})`\n\n")
run_python_blocks_from_gist(id)
