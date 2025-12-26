from gist import create_github_gist
from ask_mlx_lm import ask

model_name = "openai/gpt-oss-20b"
max_tokens = 1024

questions = [
    "What is your name? What is my name?",
    "My name is Sam.",
    "What is your name? What is my name?",
    "How do you know?",
]

gist_content = "# Learn names"

results = ask(model_name, questions)


for index, question in enumerate(questions):
    gist_content += f"\n---\n👤\n---\n {question}\n\n"
    gist_content += f"\n---\n🤖\n---\n {results[index]}\n\n"

print(
    f"[learn-names](https://gist.github.com/{create_github_gist('learn-names.md', gist_content)})"
)
