from mlx_lm import generate, load
from mlx_lm.models.cache import make_prompt_cache
from extract_and_run_python_blocks import run_python_blocks, extract_python_blocks
from ask import ask

if __name__ == "__main__":
    questions = [
        "What time is it?",
        "If you don't know the answer, Write a simple python script to tell time.",
        "Do not make it a standalone program",
    ]
    organization_name = "openai"
    model_name = "gpt-oss-20b"
    model, tokenizer = load(f"{organization_name}/{model_name}")
    md = ask(questions, model=model, tokenizer=tokenizer)
    print(md)
    print("\n```run_python_blocks(extract_python_blocks(md))```\n")
    run_python_blocks(extract_python_blocks(md))
