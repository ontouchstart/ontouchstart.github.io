# 2025/12/26 
Adventure in the world of python and rust with maturin and pytest

- [https://doc.rust-lang.org/stable/book/index.html](https://doc.rust-lang.org/stable/book/index.html)
- [https://www.maturin.rs](https://www.maturin.rs)
- [https://docs.pytest.org](https://docs.pytest.org)

```
% make

rm -f uv.lock
uv add ruff pytest 
Resolved 25 packages in 169ms
Audited 23 packages in 0.63ms
uv add "git+https://github.com/ontouchstart/ontouchstart.github.io@hello_maturin" --no-cache
   Updating https://github.com/ontouchstart/ontouchstart.github.io (hello_maturin)
    Updated https://github.com/ontouchstart/ontouchstart.github.io (ae06645377873a7609fa0a86d4c5abcaf96d9712)
Resolved 25 packages in 0.97ms
Audited 23 packages in 0.92ms
uv run ruff check
All checks passed!
uv run ruff format
2 files left unchanged
uv run main.py
sum_as_string(1, 2) = 3
sum_as_string(1.5, 2.5) = 4
sum_as_string(1.5, 2.4) = 3.9
uv run pytest  -v
============================= test session starts ==============================
platform darwin -- Python 3.14.2, pytest-9.0.2, pluggy-1.6.0 -- /Users/sam/github/ontouchstart.github.io/2025/12/26/.venv/bin/python3
cachedir: .pytest_cache
rootdir: /Users/sam/github/ontouchstart.github.io/2025/12/26
configfile: pyproject.toml
collecting ... collected 1 item

test_sum_as_string.py::test_int_sum_as_string PASSED                     [100%]

============================== 1 passed in 0.00s ===============================
```
