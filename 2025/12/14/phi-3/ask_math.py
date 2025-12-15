from mlx_lm import load
from ask import ask

if __name__ == "__main__":
    questions = [
        "What is 1+1?",
        "What is the area of a cirlce of radius 20?",
        "What is the square root of 64?"
    ]
    model, tokenizer = load("mlx-community/Phi-3.5-mini-instruct-4bit")
    ask(questions, model=model, tokenizer=tokenizer)
