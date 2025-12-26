from hello import sum_as_string
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
    main()
