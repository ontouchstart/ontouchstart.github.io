from ask import ask
from create_github_gist import create_github_gist
from mlx_lm import load

if __name__ == "__main__":
    organization_name = "openai"
    model_name = "gpt-oss-20b"
    model, tokenizer = load(f"{organization_name}/{model_name}")
    question = "draw a mermaid diagram to show the history of the LLM before yourself."
    result = ask(question, model=model, tokenizer=tokenizer)
    id = create_github_gist("history-of-LLM.md", result)
    print(f"[gist](https://gist.github.com/{id})")
