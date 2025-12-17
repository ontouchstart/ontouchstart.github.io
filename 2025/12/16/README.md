# 2025/12/16 Learn Names
```python
     1	from openai import OpenAI
     2	
     3	client = OpenAI(
     4	    base_url="http://localhost:8080/v1",  # The address of our mlx_lm.server
     5	    api_key="not-needed",  # No API key is needed for local inference
     6	)
     7	
     8	
     9	questions = [
    10	    "What is your name? What is my name?",
    11	    "My name is Sam.",
    12	    "What is your name? What is my name?",
    13	    "How do you know?",
    14	]
    15	
    16	messages = [{"role": "user", "content": content} for content in questions]
    17	completion = client.chat.completions.create(
    18	    messages=messages, model="openai/gpt-oss-20b"
    19	)
    20	
    21	for choice in completion.choices:
    22	    print(choice.message.content)
```
```uv run learn-names.py```
```
<|channel|>analysis<|message|>The user says: "What is your name? What is my name?" Then user says "My name is Sam." Then user repeats: "What is your name? What is your name?" Actually they wrote: "What is your name? What is my name?" again. Then "How do you know?" So the user is asking how I know their name. I should respond that I know because they told me. Also answer my name: I am ChatGPT. So respond: "I'm ChatGPT, and you told me your name is Sam." Also mention that I don't have memory beyond the conversation. So answer accordingly.<|end|><|start|>assistant<|channel|>final<|message|>I’m ChatGPT, the AI assistant you’re chatting with.  
You told me your name is Sam, so that’s what I know. I don’t “remember” anything beyond this conversation, so I only know your name because you just shared it with me.<|return|>
```
