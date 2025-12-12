from create_github_gist import create_github_gist


def hello():
    file_name = "hello.md"

    content = """
# Hello
"""

    return create_github_gist(file_name, content)


if __name__ == "__main__":
    print(f"https://gist.github.com/{hello()}")
