def main():
    print("Hello from 20!")
    content = """# 2025/12/20 Fun with MathJax

[mathjax](mathjax)

"""
    with open("README.md", "w") as file:
        file.write(content)


if __name__ == "__main__":
    main()
