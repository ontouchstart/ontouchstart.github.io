# 2025/12/26 Adventure with maturin and pytest

- [https://doc.rust-lang.org/stable/book/index.html](https://doc.rust-lang.org/stable/book/index.html)
- [https://www.maturin.rs](https://www.maturin.rs)
- [https://docs.pytest.org](https://docs.pytest.org)


```
% make
rm -rf uv.lock .venv
uv add ruff pytest 
uv add "git+https://github.com/ontouchstart/ontouchstart.github.io@hello_maturin" --no-cache
uv run ruff check
All checks passed!
uv run ruff format
3 files left unchanged
uv run main.py

# 2025/12/26
Adventure in the world of python and rust with maturin and pytest

- [https://doc.rust-lang.org/stable/book/index.html](https://doc.rust-lang.org/stable/book/index.html)
- [https://www.maturin.rs](https://www.maturin.rs)
- [https://docs.pytest.org](https://docs.pytest.org)


sum_as_string(1, 2) = 3
uv run pytest  -v
============================= test session starts ==============================
platform darwin -- Python 3.14.2, pytest-9.0.2, pluggy-1.6.0 -- /Users/sam/github/ontouchstart.github.io/2025/12/26/.venv/bin/python
cachedir: .pytest_cache
rootdir: /Users/sam/github/ontouchstart.github.io/2025/12/26
configfile: pyproject.toml
collecting ... collected 1 item

test_sum_as_string.py::test_int_sum_as_string PASSED                     [100%]

============================== 1 passed in 0.00s ===============================
```
