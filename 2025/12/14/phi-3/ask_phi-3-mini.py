from mlx_lm import load
from ask import ask

if __name__ == "__main__":
    questions = [
        "Explain why it is surprising that one can build a language model small enough to fit on a phone, yet almost as powerful as ChatGPT. Just use one funny sentence.",
        "Okay now more serious answer, and note that this was achieved solely by changing the training data.",
    ]
    model, tokenizer = load("mlx-community/Phi-3.5-mini-instruct-4bit")
    ask(questions, model=model, tokenizer=tokenizer)
