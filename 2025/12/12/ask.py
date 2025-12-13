from mlx_lm import generate, load


def ask(question: str, model, tokenizer):
    content = f"Please answer this question?\n{question}"
    conversation = [{"role": "user", "content": content}]
    prompt = tokenizer.apply_chat_template(
        conversation=conversation, add_generation_prompt=True, reasoning_effort="low"
    )
    result = generate(model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=4096)
    return result


if __name__ == "__main__":
    question = "What time is it?"
    organization_name = "openai"
    model_name = "gpt-oss-20b"
    model, tokenizer = load(f"{organization_name}/{model_name}")
    result = ask(question, model=model, tokenizer=tokenizer)
    print(result)
