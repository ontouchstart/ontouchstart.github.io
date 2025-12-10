import sys
from mlx_lm import generate, load

organization_name = "openai"
model_name = "gpt-oss-20b"
model, tokenizer = load(f"{organization_name}/{model_name}")


def explain(file_name: str):
    print(f"Explain {file_name}")
    with open(file_name, "r") as file:
        content = file.read()
        conversation = [
            {
                "role": "user",
                "content": f"Explain program {file_name} line by line\n {content}",
            }
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
            max_tokens=4096,
            verbose=True,
        )
        print(result)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        explain(sys.argv[1])
    else:
        explain(sys.argv[0])
