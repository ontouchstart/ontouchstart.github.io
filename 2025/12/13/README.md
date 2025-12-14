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
2025-12-13 20:19:01
08:19 PM
