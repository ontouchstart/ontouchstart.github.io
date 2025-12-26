# 2025/12/26 
Adventure in the world of python and rust with maturin and pytest

- [https://doc.rust-lang.org/stable/book/index.html](https://doc.rust-lang.org/stable/book/index.html)
- [https://www.maturin.rs](https://www.maturin.rs)
- [https://docs.pytest.org](https://docs.pytest.org)

```
% make
make -C hello
uv add ruff maturin pytest 
uv run ruff format
3 files left unchanged
uv run maturin dev
✏️ Setting installed package as editable
uv run pytest -v
============================= test session starts ==============================
platform darwin -- Python 3.14.2, pytest-9.0.2, pluggy-1.6.0 -- /Users/sam/github/ontouchstart.github.io/2025/12/26/hello/.venv/bin/python3
cachedir: .pytest_cache
rootdir: /Users/sam/github/ontouchstart.github.io/2025/12/26/hello
configfile: pyproject.toml
collecting ... collected 3 items

python/tests/test_all.py::test_sum_as_string PASSED                      [ 33%]
test_sum_as_string.py::test_int_sum_as_string PASSED                     [ 66%]
test_sum_as_string.py::test_float_sum_as_string PASSED                   [100%]

============================== 3 passed in 0.24s ===============================
uv run maturin build
rm uv.lock
uv add pytest hello/target/wheels/hello-0.1.0-cp314-cp314-macosx_11_0_arm64.whl
uv run main.py
sum_as_string(1, 2) = 3
sum_as_string(1.5, 2.5) = 4
sum_as_string(1.5, 2.4) = 3.9
uv run pytest test_sum_as_string.py -v
============================= test session starts ==============================
platform darwin -- Python 3.14.2, pytest-9.0.2, pluggy-1.6.0 -- /Users/sam/github/ontouchstart.github.io/2025/12/26/.venv/bin/python3
cachedir: .pytest_cache
rootdir: /Users/sam/github/ontouchstart.github.io/2025/12/26
configfile: pyproject.toml
collecting ... collected 2 items

test_sum_as_string.py::test_int_sum_as_string PASSED                     [ 50%]
test_sum_as_string.py::test_float_sum_as_string PASSED                   [100%]

============================== 2 passed in 0.00s ===============================
```
