from openai import OpenAI

client = OpenAI(
    base_url="http://localhost:8080/v1",  # The address of our mlx_lm.server
    api_key="not-needed",  # No API key is needed for local inference
)


questions = [
    "What is the square root of 20?",
    "Write a python program to compute the square root of 20.",
    "Your answer is made up.",
    "How did you get the answer without using tools?",
    "If you do not know the answer, just say you don't know.",
]

messages = [{"role": "user", "content": content} for content in questions]
print(client.chat.completions.create(messages=messages, model="openai/gpt-oss-20b"))
