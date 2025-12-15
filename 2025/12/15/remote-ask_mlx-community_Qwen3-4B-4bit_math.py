import requests


def run_remote(url):
    response = requests.get(url)
    print(f"## [code]({url})")
    code = response.content.decode("utf-8")
    print("```python")
    print(code)
    print("```")
    print("## Result")
    print("```")
    exec(code, globals())
    print("```")


url = (
    "https://ontouchstart.github.io/2025/12/15/ask_mlx-community_Qwen3-4B-4bit_math.py"
)
run_remote(url)
