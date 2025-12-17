from openai import OpenAI

client = OpenAI(
    base_url="http://localhost:8080/v1",  # The address of our mlx_lm.server
    api_key="not-needed",  # No API key is needed for local inference
)


questions = [
    "What is your name? What is my name?",
    "My name is Sam.",
    "What is your name? What is my name?",
    "How do you know?",
]

messages = [{"role": "user", "content": content} for content in questions]
completion = client.chat.completions.create(
    messages=messages, model="openai/gpt-oss-20b"
)

for choice in completion.choices:
    print(choice.message.content)
