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


url = "https://raw.githubusercontent.com/ml-explore/mlx-lm/refs/heads/main/tests/test_generate.py"
run_remote(url)
