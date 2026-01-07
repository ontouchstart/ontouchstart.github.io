import ontouchstart

name = "notebook-2026-01-06"


def url():
    return "https://ontouchstart.github.io/rust-notebook/book/2026/01/06"


def test_url():
    assert url() == "https://ontouchstart.github.io/rust-notebook/book/2026/01/06"


def test_ontouchstart_url():
    assert (
        ontouchstart.url()
        == "https://github.com/ontouchstart/ontouchstart.github.io/tree/2026_01_06_py"
    )


def main():
    print("Hello, world!")
    print(url())
    print(ontouchstart.url())


if __name__ == "__main__":
    main()
