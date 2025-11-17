# main.py
"""
FastAPI server that returns a complete reply from lmstudio 1.x.

The endpoint accepts a list of user messages, builds a chat context,
asks the LLM and returns the final answer in JSON.

Author:  Sam (ontouchstart.github.io)
"""

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import lmstudio as lms

# --------------------------------------------------------------------------- #
# 1️⃣ One‑time LLM client – initialise once, reuse forever
# --------------------------------------------------------------------------- #
_llm = lms.llm()          # creates the HTTP client internally

# --------------------------------------------------------------------------- #
# 2️⃣ FastAPI app + endpoints
# --------------------------------------------------------------------------- #
app = FastAPI(title="Shopkeeper AI Gateway")

class ChatRequest(BaseModel):
    messages: list[str]   # simple schema

# --------------------------------------------------------------------------- #
# 3️⃣ Endpoint – returns the full reply as a single JSON field
# --------------------------------------------------------------------------- #
@app.post("/chat")
async def chat(req: ChatRequest):
    """
    POST /chat
    Body: { "messages": ["Hello", "How are you?"] }
    Returns: { "reply": "<full answer>" }
    """
    if not req.messages:
        raise HTTPException(status_code=400, detail="messages list cannot be empty")

    # Build chat context
    chat = lms.Chat(
        "You are a helpful shopkeeper assisting a foreign traveller."
    )
    for msg in req.messages:
        chat.add_user_message(msg)

    # Ask the LLM (synchronously – we wait for the full response)
    result = _llm.respond(chat)

    # Grab the final answer.  lmstudio 1.x uses `content`.
    answer = getattr(result, "content", None)
    # Fallback to other possible attribute names if the library changes
    if answer is None:
        answer = getattr(result, "output", None) or getattr(result, "text", None)
    if answer is None:
        raise RuntimeError(
            f"Result {result!r} has no output attribute. "
            "Check that lmstudio is correctly installed."
        )

    return {"reply": answer}

# --------------------------------------------------------------------------- #
# 4️⃣ Health‑check
# --------------------------------------------------------------------------- #
@app.get("/health")
def health() -> dict[str, str]:
    """Simple liveness probe."""
    return {"status": "ok"}

