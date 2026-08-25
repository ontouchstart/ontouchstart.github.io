import random

def print_random_chinese():
    # A small sample of Chinese characters
    chinese_chars = "你好世界漢字學問文化藝術科學技術歷史地理經濟社會語言"
    
    # Random number of characters (e.g., between 1 and 10)
    count = random.randint(1, 10)
    
    # Select random characters
    result = "".join(random.choice(chinese_chars) for _ in range(count))
    
    print(result)

if __name__ == "__main__":
    print_random_chinese()
