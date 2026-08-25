import random

def print_random_chinese():
    # Range of common Chinese characters (CJK Unified Ideographs)
    # \u4e00 to \u9fa5 is the main block
    start = 0x4e00
    end = 0x9fa5
    
    # Random number of characters between 1 and 20
    count = random.randint(1, 20)
    
    # Generate random characters
    chars = []
    for _ in range(count):
        char_code = random.randint(start, end)
        chars.append(chr(char_code))
    
    # Print in one line without spaces
    print("".join(chars))

if __name__ == "__main__":
    print_random_chinese()
