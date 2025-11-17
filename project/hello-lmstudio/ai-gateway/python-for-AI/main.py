#!/usr/bin/env python3
"""
Python client that POSTs to http://127.0.0.1:8000/chat
and prints only the `reply` field from the JSON response.
"""

import json
import sys

try:
    import requests  # pip install requests
except ImportError as exc:
    print("The 'requests' library is required. Install it with:\n"
          "   pip install requests", file=sys.stderr)
    raise exc

URL = "http://127.0.0.1:8000/chat"

payload = {
    "messages": ["Write a plan to learn python form AI"]
}

headers = {"Content-Type": "application/json"}

def main() -> None:
    try:
        resp = requests.post(URL, headers=headers, json=payload)
    except requests.RequestException as e:
        print(f"Request failed: {e}", file=sys.stderr)
        sys.exit(1)

    try:
        data = resp.json()
    except ValueError:
        print("Response is not valid JSON", file=sys.stderr)
        sys.exit(1)

    # Print only the 'reply' field (or a fallback message)
    reply = data.get("reply")
    if reply is None:
        print("No 'reply' field found in the response", file=sys.stderr)
    else:
        print(reply)

if __name__ == "__main__":
    main()

