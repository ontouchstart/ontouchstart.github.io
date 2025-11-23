# what-is-ChatGPT
from mlx_lm import generate, load
from mlx_lm.models.cache import load_prompt_cache, make_prompt_cache, save_prompt_cache

model_name = "openai/gpt-oss-20b"
model, tokenizer = load(model_name)
prompt_cache = make_prompt_cache(model)

print("# What is ChatGPT?")

for content in [
    "What is ChatGPT?",
    "Translate it into Chinese."
    ]:
    print("### user")
    print(content)
    conversation = [{"role": "user", "content": content}]
    prompt = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)
    results = generate(model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=1024, prompt_cache=prompt_cache),
    print("### " + model_name)
    for result in results:
        result = result.replace("<|", "\n\n<|")
        result = result.replace("|>", "|>\n\n")
        print(result)
