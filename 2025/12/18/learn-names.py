from gist import create_github_gist
from ask_mlx_lm import mlx_lm

model, tokenizer = mlx_lm.load("openai/gpt-oss-20b")

questions = [
    "What is your name? What is my name?",
    "My name is Sam.",
    "What is your name? What is my name?",
    "How do you know?",
]

prompt_cache = mlx_lm.models.cache.make_prompt_cache(model)
gist_content = "# Learn names"

for content in questions:
    gist_content += f"\n---\n👤\n---\n{content}\n\n"
    conversation = [{"role": "user", "content": content}]
    prompt = tokenizer.apply_chat_template(
        conversation=conversation,
        add_generation_prompt=True,
        reasoning_effort="low",
    )
    result = mlx_lm.generate(
        model=model,
        tokenizer=tokenizer,
        prompt=prompt,
        prompt_cache=prompt_cache,
    )
    result = result.replace("<|", "\n\n<|")
    result = result.replace("|>", "|>\n\n")
    gist_content += f"\n---\n🤖\n---\n {result}\n\n"

print(
    f"[learn-names](https://gist.github.com/{create_github_gist('learn-names.md', gist_content)})"
)
