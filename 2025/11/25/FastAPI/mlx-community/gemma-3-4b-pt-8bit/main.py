import os
from mlx_lm import generate, load
from fastapi import FastAPI

organization_name = os.getcwd().split('/')[-2]
model_name = os.getcwd().split('/')[-1]
model, tokenizer = load(f"{organization_name}/{model_name}")

app = FastAPI()

@app.get("/tokens")
async def get_tokens(prompt: str):
    tokens = tokenizer.encode(prompt)
    conversation = [{"role": "user", "content": prompt}]

    return {
            "tokens": [{token : tokenizer.decode(token)} for token in tokens],
            }

@app.get("/generate")
async def get_generate(prompt: str):
    tokens = tokenizer.encode(prompt)
    result = generate(model=model, tokenizer=tokenizer, prompt=tokens, max_tokens=1024)

    return {
            "result_tokens": [{ token: tokenizer.decode(token)} for token in tokenizer.encode(result)],
            "result": result
            }

