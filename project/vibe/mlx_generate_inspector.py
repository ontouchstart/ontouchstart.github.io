#!/usr/bin/env python3
"""
mlx_generate_inspector.py

A quick script to investigate how the `mlx_lm.generate` command works.
It mimics the CLI arguments, introspects the function, and runs a sample
generation.

Usage:
    python mlx_generate_inspector.py --prompt "Once upon a time" --max-tokens 50
"""

import argparse
import inspect
import time
import sys

# Import the library that contains the generate function
try:
    import mlx_lm
    model, tokenizer = mlx_lm.load("mistralai/Mistral-7B-Instruct-v0.3")
except ImportError as exc:
    print("Error: mlx_lm is not installed. Install it with `pip install mlx-lm`.", file=sys.stderr)
    sys.exit(1)


def show_function_info():
    """
    Print the signature and docstring of mlx_lm.generate.
    """
    func = mlx_lm.generate
    print("\n=== mlx_lm.generate ===")
    print(f"Signature: {inspect.signature(func)}")
    print("\nDocstring:")
    print(inspect.getdoc(func) or "(no docstring)")
    print("========================\n")


def run_generation(prompt: str, max_tokens: int):
    """
    Call mlx_lm.generate with the given prompt and max_tokens.
    """
    print(f"Generating text for prompt: {prompt!r} (max_tokens={max_tokens})")
    start = time.perf_counter()
    try:
        # mlx_lm.generate returns a generator that yields tokens.
        # We join them into a single string.
        output = "".join(mlx_lm.generate(model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=max_tokens))
    except Exception as exc:
        print(f"Error during generation: {exc}", file=sys.stderr)
        sys.exit(1)
    elapsed = time.perf_counter() - start
    print("\n=== Generated Text ===")
    print(output)
    print("======================")
    print(f"\nTime taken: {elapsed:.3f} seconds\n")


def parse_args():
    """
    Parse command‑line arguments.
    """
    parser = argparse.ArgumentParser(
        description="Investigate mlx_lm.generate from the command line."
    )
    parser.add_argument(
        "--prompt",
        type=str,
        required=True,
        help="Prompt text to feed to the model.",
    )
    parser.add_argument(
        "--max-tokens",
        type=int,
        default=50,
        help="Maximum number of tokens to generate (default: 50).",
    )
    return parser.parse_args()


def main():
    args = parse_args()
    show_function_info()
    run_generation(args.prompt, args.max_tokens)


if __name__ == "__main__":
    main()
