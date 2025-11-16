from mlx_lm import generate, load

checkpoint = "openai/gpt-oss-20b"

model, tokenizer = load(path_or_hf_repo=checkpoint)

prompt = "write a hello world in rust and call it in python as a dynamic library in macOS"
conversation = [{"role": "user", "content": prompt}]

prompt = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)

generate(model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=1024*10, verbose=True)
