import requests
from ask_mlx_lm import review

model_name = "openai/gpt-oss-20b"
code = requests.get(
    "https://raw.githubusercontent.com/PyO3/maturin/refs/heads/main/src/bridge.rs"
).text
max_tokens = 1024 * 10
reasoning_effort = "low"
print("# Code Review")
print("```")
print(code)
print("```")
for result in review(model_name, code, max_tokens, reasoning_effort):
    print(result)
