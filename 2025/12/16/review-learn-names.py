import requests
from mlx_lm import generate, load
from mlx_lm.models.cache import make_prompt_cache

url = "https://ontouchstart.github.io/2025/12/16/learn-names.py"
code = requests.get(url).text

print("# Review learn-names.py")
print('```python')
print(code)
print('```')

model, tokenizer = load("openai/gpt-oss-20b")

questions = [f"How does this python works?\n{code}"]

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
        max_tokens=1024 * 100,
        prompt_cache=prompt_cache,
    )
    print(result)
