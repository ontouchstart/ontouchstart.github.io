from mlx_lm import load, stream_generate

def query(repo):
    prompt = "Give a high level overview of the history of large language model"
    print("## " + repo)
    print()

    model, tokenizer = load(repo)
    messages = [{"role": "user", "content": prompt}]
    tokens = tokenizer.apply_chat_template( messages, add_generation_prompt=True )

    for response in stream_generate(model, tokenizer, tokens, max_tokens=1024*32):
       print(response.text, end="", flush=True)

    print()

def main():
    print("# History of large language model")

    repos = [
        "mlx-community/Mistral-7B-Instruct-v0.3-4bit",
        "openai/gpt-oss-20b"
    ]

    for repo in repos: 
        query(repo);

if __name__ == "__main__":
    main()

