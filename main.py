import ontouchstart


def main():
    print("2026/01/02")
    print(ontouchstart.url())
    print("resume")
    for p in ontouchstart.resume():
        print(p.text)


if __name__ == "__main__":
    main()
