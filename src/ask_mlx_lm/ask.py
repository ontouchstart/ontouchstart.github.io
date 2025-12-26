import mlx_lm


def ask(model_name, questions, max_tokens=1024):
    model, tokenizer = mlx_lm.load(model_name)

    prompt_cache = mlx_lm.models.cache.make_prompt_cache(model)
    results = []

    for content in questions:
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
            max_tokens=max_tokens,
        )
        result = result.replace("<|", "\n\n<|")
        result = result.replace("|>", "|>\n\n")
        results.append(result)
    return results
