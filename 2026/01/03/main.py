from random import randint
from sys import maxsize
from ontouchstart import sum_as_string


def main(n=10):
    for i in range(n):
        x = randint(0, maxsize)
        y = randint(0, maxsize)
        print(f"""sum_as_string({x}, {y}) = {sum_as_string(x, y)} """)
        print(f"""{x} + {y} = {x + y} """)


if __name__ == "__main__":
    main(100)

