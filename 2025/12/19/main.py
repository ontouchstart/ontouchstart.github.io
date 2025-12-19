def main():
    content = r"""# 2025/12/19 Random Ideas

## Human Learning in the Age of Machine Learning

## Literate Programming with Python Modules and Packages

## Markdown as I/O Format

## Probalistic and Heuristic Learning

## Branching and Immutability

## Layers, Stacks and Graphs

## MathJaX

This is math in TeX: $$x+1\over x-1$$

"""
    with open("README.md", "w") as file:
        file.write(content)


if __name__ == "__main__":
    main()
