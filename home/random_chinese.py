import random

def print_random_chinese():
    # A small sample of Chinese characters
    chinese_chars = "你好世界编程计算机网络人工智能数据科学机器学习深度学习自动化机器人"
    # Or better, a larger set or just a representative one
    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" # Wait, these are not Chinese.
    
    # Let's use a more comprehensive list or just a string of common characters
    # Since I can't easily provide all 5000+ characters, I'll use a representative string.
    chinese_pool = "你好世界编程计算机网络人工智能数据科学机器学习深度学习自动化机器人智能系统信息安全云技术物联网大数据区块链虚拟现实增强现实智能制造智能交通智能城市智能教育智能医疗智能金融智能制造智能交通智能城市智能教育智能医疗智能金融"
    
    # Ensure we have unique characters if we want to avoid repeating the same one too much, 
    # but the prompt doesn't specify uniqueness.
    
    count = random.randint(1, 20)
    result = "".join(random.choice(chinese_pool) for _ in range(count))
    print(result)

if __name__ == "__main__":
    print_random_chinese()
