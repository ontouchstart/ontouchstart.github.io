from mlx_lm import generate
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
        print("## conversation")
        print(conversation)
        print("## result")
        print(result)
    return result
