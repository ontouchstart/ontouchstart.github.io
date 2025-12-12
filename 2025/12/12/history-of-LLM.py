from ask import ask
from create_github_gist import create_github_gist

result = ask("draw a mermaid diagram to show the history of the LLM before yourself.")
id = create_github_gist("history-of-LLM.md", result)
print(f"[gist](https://gist.github.com/{id})")
