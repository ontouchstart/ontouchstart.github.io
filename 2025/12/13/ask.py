from mlx_lm import generate, load
from mlx_lm.models.cache import make_prompt_cache


def ask(questions, model, tokenizer):
    prompt_cache = make_prompt_cache(model)
    for content in questions:
        conversation = [{"role": "user", "content": content}]
        prompt = tokenizer.apply_chat_template(
            conversation=conversation,
            add_generation_prompt=True,
            reasoning_effort="low",
        )
        result = generate(
            model=model,
            tokenizer=tokenizer,
            prompt=prompt,
            max_tokens=4096,
            prompt_cache=prompt_cache,
        )
    return result


if __name__ == "__main__":
    questions = [
        "What time is it?",
        "If you don't know the answer, Write a python program to tell time.",
    ]
    organization_name = "openai"
    model_name = "gpt-oss-20b"
    model, tokenizer = load(f"{organization_name}/{model_name}")
    result = ask(questions, model=model, tokenizer=tokenizer)
    print(result)
