import requests
import mlx_lm


def review(model_name, url, max_tokens=2048):
    model, tokenizer = mlx_lm.load(model_name)

    prompt_cache = mlx_lm.models.cache.make_prompt_cache(model)

    content = f"Review following content: {requests.get(url).text}"

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
    return answer


if __name__ == "__main__":
    models = [
        "mlx-community/Llama-3.2-3B-Instruct-4bit",
        "mlx-community/Mistral-7B-Instruct-v0.3-4bit",
        "openai/gpt-oss-20b",
        "Qwen/Qwen3-14B-MLX-4bit",
    ]
    url = "https://ontouchstart.github.io/2026/01/03/ask.md"
    print("# Review the same content by different LLMs")
    print(f"<{url}>")
    for model_name in models:
        print(f"## Model: {model_name}\n")
        answer = review(model_name, url)
        print(answer)
        print()
