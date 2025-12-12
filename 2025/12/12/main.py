def main():
    print("Hello from 12!")


def iPython():
    try:
        print(get_ipython())
    except NameError:
        print("Not in iPython ")


if __name__ == "__main__":
    main()
    iPython()
