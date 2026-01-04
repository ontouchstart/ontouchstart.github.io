import mlx_lm


def ask(model_name, questions, max_tokens=1024):
    model, tokenizer = mlx_lm.load(model_name)

    prompt_cache = mlx_lm.models.cache.make_prompt_cache(model)
    answers = []

    for content in questions:
        conversation = [{"role": "user", "content": content}]
        prompt = tokenizer.apply_chat_template(
            conversation=conversation,
            add_generation_prompt=True,
        )
        answer = mlx_lm.generate(
            model=model,
            tokenizer=tokenizer,
            prompt=prompt,
            prompt_cache=prompt_cache,
            max_tokens=max_tokens,
        )
        answer = answer.replace("<|", "\n\n<|")
        answer = answer.replace("|>", "|>\n\n")
        answers.append(answer)
    return answers


if __name__ == "__main__":
    questions = ["Tell me an LLM joke.", "Why is it funny?"]
    models = [
        "mlx-community/Llama-3.2-3B-Instruct-4bit",
        "mlx-community/Mistral-7B-Instruct-v0.3-4bit",
        "openai/gpt-oss-20b",
    ]
    for model_name in models:
        print(f"# Model: {model_name}\n")
        answers = ask(model_name, questions)
        for i, question in enumerate(questions):
            print("## Question")
            print(questions[i])
            print()
            print("## Answer")
            print(answers[i])
