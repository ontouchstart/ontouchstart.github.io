# 2025/12/16 Learn Names
[learn-names.py](learn-names.py)
```python
     1	from mlx_lm import generate, load
     2	from mlx_lm.models.cache import make_prompt_cache
     3	
     4	model, tokenizer = load("openai/gpt-oss-20b")
     5	
     6	questions = [
     7	    "What is your name? What is my name?",
     8	    "My name is Sam.",
     9	    "What is your name? What is my name?",
    10	    "How do you know?",
    11	]
    12	
    13	prompt_cache = make_prompt_cache(model)
    14	for content in questions:
    15	    conversation = [{"role": "user", "content": content}]
    16	    prompt = tokenizer.apply_chat_template(
    17	        conversation=conversation,
    18	        add_generation_prompt=True,
    19	        reasoning_effort="low",
    20	    )
    21	    result = generate(
    22	        model=model,
    23	        tokenizer=tokenizer,
    24	        prompt=prompt,
    25	        prompt_cache=prompt_cache,
    26	    )
    27	    print(result)
```
```uv run learn-names.py```
```
<|channel|>analysis<|message|>We need to answer. We don't know user's name. So say we don't know.<|end|><|start|>assistant<|channel|>final<|message|>I’m ChatGPT, the AI assistant you’re chatting with. I don’t actually know your name—unless you tell me! If you’d like me to use a particular name, just let me know.
<|channel|>analysis<|message|>We respond acknowledging.<|end|><|start|>assistant<|channel|>final<|message|>Nice to meet you, Sam! How can I help you today?
<|channel|>analysis<|message|>We know Sam. So answer.<|end|><|start|>assistant<|channel|>final<|message|>I’m ChatGPT, the AI assistant you’re chatting with. Your name is Sam. How can I help you today?
<|channel|>analysis<|message|>Explain we inferred from previous message.<|end|><|start|>assistant<|channel|>final<|message|>I learned it from what you just told me—“My name is Sam.” Once you share that, I can remember it for the rest of our conversation. If you’d prefer I not keep it in mind, just let me know!
```
[learn-names-openai.py](learn-names-openai.py)
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
```uv run learn-names-openai.py```
```
<|channel|>analysis<|message|>The user says: "What is your name? What is my name?" Then user says "My name is Sam." Then user repeats: "What is your name? What is your name?" Actually they wrote: "What is your name? What is my name?" again. Then "How do you know?" So the user is asking how I know their name. I should respond that I know because they told me. Also answer my name: I am ChatGPT. So respond: "I'm ChatGPT, and you told me your name is Sam." Also mention that I don't have memory beyond the conversation. So answer accordingly.<|end|><|start|>assistant<|channel|>final<|message|>I’m ChatGPT, the AI assistant you’re chatting with.  
You told me your name is Sam, so that’s what I know. I don’t “remember” anything beyond this conversation, so I only know your name because you just shared it with me.<|return|>
```
```uv run review-learn-names.py > review-learn-names.md```

[review-learn-names](review-learn-names)

```uv run review-learn-names-openai.py > review-learn-names-openai.md```

[review-learn-names-openai](review-learn-names-openai)

