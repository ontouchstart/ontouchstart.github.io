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
            verbose=True,
        )
        print("## conversation")
        print(conversation)
        print("## result")
        print(result)
    return result


check_point = "mlx-community/Qwen1.5-0.5B-Chat-4bit"

questions = [
    "What is the square root of 20?",
    "Write a python program to compute the square root of 20.",
    "Your answer is made up.",
    "How did you get the answer without using tools?",
    "If you do not know the answer, just say you don't know.",
]

model, tokenizer = load(check_point)
ask(questions, model=model, tokenizer=tokenizer)
