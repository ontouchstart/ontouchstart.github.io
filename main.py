from ontouchstart import url


def test_url():
    assert (
        url()
        == "https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_06_py"
    )


def main():
    print("Hello, world!")
    print(url())


if __name__ == "__main__":
    main()
