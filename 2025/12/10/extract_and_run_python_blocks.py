import regex as re


def extract_python_blocks(md_text: str) -> list[str]:
    """
    Return a list of Python code blocks found in the Markdown string.
    """
    pattern = r"```python\s*(.*?)\s*```"
    # DOTALL makes `.` match newlines
    return re.findall(pattern, md_text, flags=re.DOTALL)


def run_python_blocks(python_blocks: list[str]):
    for code in python_blocks:
        exec(code, globals())


if __name__ == "__main__":
    input = "datetime.md"
    with open(input, "r") as file:
        md_text = file.read()
        print(f"## input ({input})")
        print(md_text)
        print("## output")
        print("```")
        run_python_blocks(extract_python_blocks(md_text))
        print("```")
