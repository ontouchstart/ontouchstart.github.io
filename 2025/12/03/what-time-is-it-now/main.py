import datetime
import json
from mlx_lm import generate, load
from mlx_lm.models.cache import make_prompt_cache

checkpoint = "mlx-community/Qwen2.5-7b-Instruct-4bit"
model, tokenizer = load(path_or_hf_repo=checkpoint)

def now():
    """
    A function that returns current time 
    """
    return f"{datetime.datetime.now()}"

def print_prompt(prompt):
    print("prompt")
    print("-" * 80)
    i = 0
    for token in prompt:
        i += 1
        print((i, token, tokenizer.decode(token)))

tools = {"now": now}

content = "What time is it now?"

print(f"# {content}")
print('```')
print("-" * 80)
print("Direct answer")
print(now())
print('```')

print("# Over engineered answer via tool call")

print('```')
messages = [{"role": "user", "content": content}]
print("messages")
print("-" * 80)
print(messages)

prompt = tokenizer.apply_chat_template(
    messages, add_generation_prompt=True, tools=list(tools.values())
)
prompt_cache = make_prompt_cache(model)

print("Initial tool call")
print("-" * 80)
response = generate(
    model=model,
    tokenizer=tokenizer,
    prompt=prompt,
    verbose=True,
    prompt_cache=prompt_cache,
)
print_prompt(prompt)

tool_open = "<tool_call>"
tool_close = "</tool_call>"
start_tool = response.find(tool_open) + len(tool_open)
end_tool = response.find(tool_close)
tool_call = json.loads(response[start_tool:end_tool].strip())
tool_result = tools[tool_call["name"]](**tool_call["arguments"])

print("tool_call")
print("-" * 80)
print(tool_call)
print("tool_result")
print("-" * 80)
print(tool_result)

# Put the tool result in the prompt
messages = [{"role": "tool", "name": tool_call["name"], "content": tool_result}]
print("messages")
print("-" * 80)
print(messages)
prompt = tokenizer.apply_chat_template(
    messages,
    add_generation_prompt=True,
)

generate(
    model=model,
    tokenizer=tokenizer,
    prompt=prompt,
    verbose=True,
    prompt_cache=prompt_cache,
)
print_prompt(prompt)
print('```')
