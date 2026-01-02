import ontouchstart
from ontouchstart_dev import resume


def main():
    print(ontouchstart.url())
    print("2026/01/02")
    print("resume")
    for p in ontouchstart.resume():
        print(p.text)

if __name__ == "__main__":
    main()
