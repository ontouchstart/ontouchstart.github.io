name = "notebook-2026-01-06"
def main():
    return f"Hello from {name}!"

def test_main():
    assert main() == f"Hello from {name}!"

if __name__ == "__main__":
    print(main())

