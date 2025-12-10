from mlx_lm import generate, load
from fastapi import FastAPI
from pydantic import BaseModel


class Prompt(BaseModel):
    content: str


organization_name = "openai"
model_name = "gpt-oss-20b"
model, tokenizer = load(f"{organization_name}/{model_name}")

app = FastAPI()


@app.get("/tokens")
async def get_tokens(prompt: str):
    raw_tokens = tokenizer.encode(prompt)
    conversation = [{"role": "user", "content": prompt}]
    prompt_tokens = tokenizer.apply_chat_template(
        conversation=conversation, add_generation_prompt=True
    )

    return {
        "raw_tokens": [{token: tokenizer.decode(token)} for token in raw_tokens],
        "prompt_tokens": [{token: tokenizer.decode(token)} for token in prompt_tokens],
    }


@app.get("/generate")
async def get_generate(prompt: str):
    raw_tokens = tokenizer.encode(prompt)
    conversation = [{"role": "user", "content": prompt}]
    prompt_tokens = tokenizer.apply_chat_template(
        conversation=conversation, add_generation_prompt=True
    )
    result = generate(
        model=model, tokenizer=tokenizer, prompt=prompt_tokens, max_tokens=1024
    )
    raw_result = generate(
        model=model, tokenizer=tokenizer, prompt=raw_tokens, max_tokens=1024
    )

    return {
        "raw_result_tokens": [
            {token: tokenizer.decode(token)} for token in tokenizer.encode(raw_result)
        ],
        "conversation": conversation,
        "prompt_tokens": [{token: tokenizer.decode(token)} for token in prompt_tokens],
        "result_tokens": [
            {token: tokenizer.decode(token)} for token in tokenizer.encode(result)
        ],
        "raw_result": raw_result,
        "result": result,
    }


@app.post("/tokens")
async def post_tokens(prompt: Prompt):
    raw_tokens = tokenizer.encode(prompt.content)
    conversation = [{"role": "user", "content": prompt.content}]
    prompt_tokens = tokenizer.apply_chat_template(
        conversation=conversation, add_generation_prompt=True
    )

    return {
        "raw_tokens": [{token: tokenizer.decode(token)} for token in raw_tokens],
        "prompt_tokens": [{token: tokenizer.decode(token)} for token in prompt_tokens],
    }


@app.post("/generate")
async def post_generate(prompt: Prompt):
    raw_tokens = tokenizer.encode(prompt.content)
    conversation = [{"role": "user", "content": prompt.content}]
    prompt_tokens = tokenizer.apply_chat_template(
        conversation=conversation, add_generation_prompt=True
    )
    result = generate(
        model=model, tokenizer=tokenizer, prompt=prompt_tokens, max_tokens=1024
    )
    raw_result = generate(
        model=model, tokenizer=tokenizer, prompt=raw_tokens, max_tokens=1024
    )

    return {
        "raw_result_tokens": [
            {token: tokenizer.decode(token)} for token in tokenizer.encode(raw_result)
        ],
        "conversation": conversation,
        "prompt_tokens": [{token: tokenizer.decode(token)} for token in prompt_tokens],
        "result_tokens": [
            {token: tokenizer.decode(token)} for token in tokenizer.encode(result)
        ],
        "raw_result": raw_result,
        "result": result,
    }
