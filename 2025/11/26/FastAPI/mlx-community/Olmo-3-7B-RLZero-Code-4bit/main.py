import os
from mlx_lm import load, generate

organization_name = os.getcwd().split('/')[-2]
model_name = os.getcwd().split('/')[-1]
model, tokenizer = load(f"{organization_name}/{model_name}")

prompt = "hello"

if tokenizer.chat_template is not None:
    messages = [{"role": "user", "content": prompt}]
    prompt = tokenizer.apply_chat_template(
        messages, add_generation_prompt=True
    )

response = generate(model, tokenizer, prompt=prompt, verbose=True)

