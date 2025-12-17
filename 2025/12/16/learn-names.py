from mlx_lm import generate, load
from mlx_lm.models.cache import make_prompt_cache

model, tokenizer = load("openai/gpt-oss-20b")

questions = [
    "What is your name? What is my name?",
    "My name is Sam.",
    "What is your name? What is my name?",
    "How do you know?",
]

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
     prompt_cache=prompt_cache,
  )
  print(result)
