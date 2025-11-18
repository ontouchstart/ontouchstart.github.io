``` 
uv init .
uv add pytest-playwright
uv run playwright install
uv pytest
uv run pytest
============================= test session starts ==============================
platform darwin -- Python 3.14.0, pytest-8.4.2, pluggy-1.6.0
rootdir: /Users/sam/github/ontouchstart.github.io/project/hello-pytest-playwright
configfile: pyproject.toml
plugins: base-url-2.1.0, playwright-0.7.1
collected 2 items

test_example.py ..                                                       [100%]

============================== 2 passed in 0.69s ===============================
```
