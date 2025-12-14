# 2025/12/13 ask_time.py
```
     1	from mlx_lm import generate, load
     2	from mlx_lm.models.cache import make_prompt_cache
     3	from extract_and_run_python_blocks import run_python_blocks, extract_python_blocks
     4	from ask import ask
     5	
     6	if __name__ == "__main__":
     7	    questions = [
     8	        "What time is it?",
     9	        "If you don't know the answer, Write a simple python script to tell time.",
    10	        "Do not make it a standalone program",
    11	    ]
    12	    organization_name = "openai"
    13	    model_name = "gpt-oss-20b"
    14	    model, tokenizer = load(f"{organization_name}/{model_name}")
    15	    md = ask(questions, model=model, tokenizer=tokenizer)
    16	    print(md)
    17	    print("\n```run_python_blocks(extract_python_blocks(md))```\n")
    18	    run_python_blocks(extract_python_blocks(md))
```
`uv run ask_time.py`
<|channel|>analysis<|message|>Provide function only.<|end|><|start|>assistant<|channel|>final<|message|>Here’s a minimal snippet you can drop into any existing Python codebase.  
It defines a single function that returns the current local time as a formatted string.

```python
from datetime import datetime

def get_current_time(fmt: str = "%Y-%m-%d %H:%M:%S") -> str:
    """
    Return the current local date and time formatted according to `fmt`.

    Parameters
    ----------
    fmt : str, optional
        A format string understood by datetime.strftime.
        Default: "%Y-%m-%d %H:%M:%S"  (e.g., 2025-12-13 14:32:07)

    Returns
    -------
    str
        The formatted current time.
    """
    return datetime.now().strftime(fmt)
```

**Usage example**

```python
print(get_current_time())          # default format
print(get_current_time("%I:%M %p"))  # 12‑hour clock with AM/PM
```

You can import `get_current_time` wherever you need it without turning the script into a standalone executable.

```run_python_blocks(extract_python_blocks(md))```

2025-12-13 20:33:45
08:33 PM
