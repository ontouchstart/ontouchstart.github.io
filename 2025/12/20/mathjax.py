import mlx_lm

model, tokenizer = mlx_lm.load("openai/gpt-oss-20b")

questions = [
    "Our output is in markdown format",
    "Write a simple mathjax snippet for pythagorean theorem",
    "Write Maxwell equations in mathjax, do not use table, make it simple.",
    "Write them in integral form",
]

prompt_cache = mlx_lm.models.cache.make_prompt_cache(model)

chat = "# Fun with MathJax"
for content in questions:
    chat += f"\n## {content}"
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
        max_tokens=1024,
        prompt_cache=prompt_cache,
    )
    result = result.replace("<|", "\n\n<|")
    result = result.replace("|>", "|>\n\n")
    chat += f"""{result}

---
"""

with open("mathjax.md", "w") as file:
    file.write(chat)
