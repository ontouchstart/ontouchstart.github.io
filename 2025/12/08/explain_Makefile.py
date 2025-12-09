from mlx_lm import generate, load

organization_name = "openai"
model_name = "gpt-oss-20b"
model, tokenizer = load(f"{organization_name}/{model_name}")


def explain(content):
    conversation = [
        {"role": "user", "content": f"What does this Makefile do?\n {content}"}
    ]
    print(conversation)
    prompt = tokenizer.apply_chat_template(
        conversation=conversation, add_generation_prompt=True
    )
    print(prompt)

    result = generate(model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=2048)
    print(result)


with open("Makefile", "r") as file:
    content = file.read()
    explain(content)
