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


url = "https://raw.githubusercontent.com/ontouchstart/ontouchstart.github.io/refs/heads/main/2025/12/15/ask_openai_gpt-oss-20b_math.py"
run_remote(url)
