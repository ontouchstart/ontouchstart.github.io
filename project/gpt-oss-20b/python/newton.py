from mlx_lm import generate, load
model, tokenizer = load("openai/gpt-oss-20b")
prompt = "Write a short story about the life of Issac Newton"

messages = [{"role": "user", "content": prompt}]
prompt = tokenizer.apply_chat_template(
    messages, add_generation_prompt=True
)

text = generate(model, tokenizer, prompt=prompt, verbose=True, max_tokens=1024*128)
print(text)
