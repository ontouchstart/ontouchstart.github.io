from mlx_lm import generate, load

organization_name = "openai"
model_name = "gpt-oss-20b"
model, tokenizer = load(f"{organization_name}/{model_name}")


def explain(file_name: str):
    with open(file_name, "r") as file:
        content = file.read()
        conversation = [
            {"role": "user", "content": f"What does file {file_name} do?\n {content}"}
        ]
        print(conversation)
        prompt = tokenizer.apply_chat_template(
            conversation=conversation, add_generation_prompt=True
        )
        print(prompt)

        result = generate(
            model=model,
            tokenizer=tokenizer,
            prompt=prompt,
            max_tokens=2048,
        )
        print(result)
