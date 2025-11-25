import os
from mlx_lm import generate, load
from fastapi import FastAPI

organization_name = os.getcwd().split('/')[-2]
model_name = os.getcwd().split('/')[-1]
model, tokenizer = load(f"{organization_name}/{model_name}")

app = FastAPI()

@app.get("/tokens")
async def get_tokens(prompt: str):
    raw_tokens = tokenizer.encode(prompt)
    conversation = [{"role": "user", "content": prompt}]
    prompt_tokens = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)

    return {
            "raw_tokens": [{token : tokenizer.decode(token)} for token in raw_tokens],
            "prompt_tokens": [{token : tokenizer.decode(token)} for token in prompt_tokens]
            }

@app.get("/generate")
async def get_generate(prompt: str):
    conversation = [{"role": "user", "content": prompt}]
    prompt_tokens = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)
    result = generate(model=model, tokenizer=tokenizer, prompt=prompt_tokens, max_tokens=1024)

    return {
            "conversation" : conversation,
            "prompt_tokens" : [{ token: tokenizer.decode(token)} for token in prompt_tokens],
            "result_tokens": [{ token: tokenizer.decode(token)} for token in tokenizer.encode(result)]
            }

