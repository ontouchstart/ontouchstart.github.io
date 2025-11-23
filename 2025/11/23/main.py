# hello.py
from mlx_lm import generate, load

model, tokenizer = load("openai/gpt-oss-20b")
content = "hello"

print("## content")
print("```")
print(content)
print("```")
conversation = [{"role": "user", "content": content}]
print("## conversation")
print("```")
print(conversation)
print("```")
prompt = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)
result = generate(model=model, tokenizer=tokenizer, prompt=prompt)
result = result.replace("<|", "\n<|")
result = result.replace("|>", "|>\n")
print("## result")
print("```")
print(result)
print("```")
