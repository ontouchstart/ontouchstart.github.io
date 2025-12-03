# based on https://github.com/ml-explore/mlx-lm/blob/main/mlx_lm/examples/tool_use.py

import json
import requests

from mlx_lm import generate, load
from mlx_lm.models.cache import make_prompt_cache

# Specify the checkpoint
checkpoint = "mlx-community/Qwen2.5-32B-Instruct-4bit"

# Load the corresponding model and tokenizer
model, tokenizer = load(path_or_hf_repo=checkpoint)


# Fetch url
def fetch(url: str):
    """
    A function that returns the content of the url 

    Args:
        url: The URL
    """
    return requests.get(url).text


tools = {"fetch": fetch}

# Specify the prompt and conversation history
url = "https://gist.githubusercontent.com/ontouchstart/0e2cefda95e78d1b7330660f1a414804/raw/088b9efef1f9530dc2f53dd38c33393b7c3d148b/who-is-beej.md"

prompt = f"Translate fetch {url} into Chinese"
messages = [{"role": "user", "content": prompt}]

prompt = tokenizer.apply_chat_template(
    messages, add_generation_prompt=True, tools=list(tools.values())
)

prompt_cache = make_prompt_cache(model)

# Generate the initial tool call:
response = generate(
    model=model,
    tokenizer=tokenizer,
    prompt=prompt,
    max_tokens=2048,
    verbose=True,
    prompt_cache=prompt_cache,
)

# Parse the tool call:
# (Note, the tool call format is model specific)
tool_open = "<tool_call>"
tool_close = "</tool_call>"
start_tool = response.find(tool_open) + len(tool_open)
end_tool = response.find(tool_close)
tool_call = json.loads(response[start_tool:end_tool].strip())
tool_result = tools[tool_call["name"]](**tool_call["arguments"])

# Put the tool result in the prompt
messages = [{"role": "tool", "name": tool_call["name"], "content": tool_result}]
prompt = tokenizer.apply_chat_template(
    messages,
    add_generation_prompt=True,
)

# Generate the final response:
response = generate(
    model=model,
    tokenizer=tokenizer,
    prompt=prompt,
    max_tokens=2048,
    verbose=True,
    prompt_cache=prompt_cache,
)
