from mlx_lm import load, stream_generate

prompt = "History of Python language in large language model"
def query(repo):
    print("\n## " + repo + "\n")

    model, tokenizer = load(repo)
    messages = [{"role": "user", "content": prompt}]
    tokens = tokenizer.apply_chat_template( messages, add_generation_prompt=True )

    for response in stream_generate(model, tokenizer, tokens, max_tokens=1024*32):
       print(response.text, end="", flush=True)

    print()

def main():
    print("# " + prompt)
    print("Benchmark models listed in the [Apple Blog](https://machinelearning.apple.com/research/exploring-llms-mlx-m5)")

    repos = [
        "Qwen/Qwen3-1.7B-MLX-bf16",
        "Qwen/Qwen3-8B-MLX-bf16",
        "Qwen/Qwen3-8B-MLX-4bit",
        "Qwen/Qwen3-14B-MLX-4bit",
        "mlx-community/gpt-oss-20b-MXFP4-Q8",
        "Qwen/Qwen3-30B-A3B-MLX-4bit"
    ]

    for repo in repos: 
        query(repo);

if __name__ == "__main__":
    main()

