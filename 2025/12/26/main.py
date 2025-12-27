from hello_maturin import sum_as_string


def main():
    x = 1
    y = 2
    print(f"sum_as_string({x}, {y}) = {sum_as_string(x, y)}")

    x = 1.5
    y = 2.5
    print(f"sum_as_string({x}, {y}) = {sum_as_string(x, y)}")

    x = 1.5
    y = 2.4
    print(f"sum_as_string({x}, {y}) = {sum_as_string(x, y)}")


if __name__ == "__main__":
    readme = """
# 2025/12/26
Adventure in the world of python and rust with maturin and pytest

- [https://doc.rust-lang.org/stable/book/index.html](https://doc.rust-lang.org/stable/book/index.html)
- [https://www.maturin.rs](https://www.maturin.rs)
- [https://docs.pytest.org](https://docs.pytest.org)

"""
    print(readme)
    main()
