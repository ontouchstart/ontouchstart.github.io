# wang-hao-IBM-704-proof
import os
from mlx_lm import generate, load
from mlx_lm.models.cache import load_prompt_cache, make_prompt_cache, save_prompt_cache

organization_name = os.getcwd().split('/')[-2]
model_name = os.getcwd().split('/')[-1]

model, tokenizer = load(f"{organization_name}/{model_name}")
prompt_cache = make_prompt_cache(model)

print("# Wang Hao and computer assisted proof on an IBM 704")

for content in [
    "Find more information about \"In 1959, Wang Hao wrote on an IBM 704 computer a program that in only 9 minutes mechanically proved several hundred mathematical logic theorems in Whitehead and Russell's Principia Mathematica.\"",
    "You have made up a lot of fabricated information. Why do you do it?",
    "Translate what you have learnd into Chinese."
    ]:
    print("### User")
    print(content)
    conversation = [{"role": "user", "content": content}]
    prompt = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)
    results = generate(model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=4028, prompt_cache=prompt_cache),
    print("### " + model_name)
    for result in results:
        print(result)
