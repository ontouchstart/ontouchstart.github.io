import mlx_lm


def review(model_name, code, max_tokens=1024 * 10):
    model, tokenizer = mlx_lm.load(model_name)

    prompt_cache = mlx_lm.models.cache.make_prompt_cache(model)
    results = []

    questions = [
        f"What programming language is following code?\n{code}",
        "What feature or features are implemented (specification)?",
        "How are they implemented (algorithm)?",
        "Are there any bugs in the code?",
        "If there are bugs, what are their consequences?",
        "How can we fix the bugs",
    ]
    for content in questions:
        conversation = [{"role": "user", "content": content}]
        prompt = tokenizer.apply_chat_template(
            conversation=conversation,
            add_generation_prompt=True,
            reasoning_effort="high",
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
