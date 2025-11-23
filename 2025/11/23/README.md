# 2025/11/23
main.py
```
     1	# hello.py
     2	from mlx_lm import generate, load
     3	
     4	model, tokenizer = load("openai/gpt-oss-20b")
     5	content = "hello"
     6	
     7	print("## content")
     8	print("```")
     9	print(content)
    10	print("```")
    11	conversation = [{"role": "user", "content": content}]
    12	print("## conversation")
    13	print("```")
    14	print(conversation)
    15	print("```")
    16	prompt = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)
    17	result = generate(model=model, tokenizer=tokenizer, prompt=prompt)
    18	result = result.replace("<|", "\n<|")
    19	result = result.replace("|>", "|>\n")
    20	print("## result")
    21	print("```")
    22	print(result)
    23	print("```")
```
## content
```
hello
```
## conversation
```
[{'role': 'user', 'content': 'hello'}]
```
## result
```

<|channel|>
analysis
<|message|>
The user says "hello". We should respond politely. Probably a friendly greeting.
<|end|>

<|start|>
assistant
<|channel|>
final
<|message|>
Hello! How can I help you today?
```
