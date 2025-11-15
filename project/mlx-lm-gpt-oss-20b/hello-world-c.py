from mlx_lm import generate, load

checkpoint = "openai/gpt-oss-20b"

model, tokenizer = load(path_or_hf_repo=checkpoint)

prompt = "Write a c program to print Hello world in Chinese"
conversation = [{"role": "user", "content": prompt}]

prompt = tokenizer.apply_chat_template(
    conversation=conversation, add_generation_prompt=True
)

max_tokens = 1_000

verbose = True

response = generate(
    model=model,
    tokenizer=tokenizer,
    prompt=prompt,
    max_tokens=max_tokens,
    verbose=verbose,
)
