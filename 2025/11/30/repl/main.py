import mlx_lm

organization_name = "openai"
model_name = "gpt-oss-20b"
model, tokenizer = mlx_lm.load(f"{organization_name}/{model_name}")

print(model)
print(tokenizer)

def generate(prompt: str):
    print("-" * 80)
    print(prompt)
    print("-" * 80)
    print("generate")
    print("-" * 80)
    input = tokenizer.encode(prompt)
    print("-" * 80)
    mlx_lm.generate(model=model, tokenizer=tokenizer, prompt=input, max_tokens=1024, verbose=True)
    print("-" * 80)

def think(prompt: str):
    print("-" * 80)
    print(prompt)
    print("-" * 80)
    print("think")
    print("-" * 80)
    conversation = [{"role": "user", "content": prompt}]
    input = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)
    print("-" * 80)
    mlx_lm.generate(model=model, tokenizer=tokenizer, prompt=input, max_tokens=1024, verbose=True)
    print("-" * 80)

def main():
    print("Hello from repl!")
    prompt = "Can we think without the help (or distraction) of language representation?"
    generate(prompt)
    think(prompt)
    prompt = "Can we communicate without the help (or distraction) of language representation?"
    generate(prompt)
    think(prompt)


if __name__ == "__main__":
    main()
