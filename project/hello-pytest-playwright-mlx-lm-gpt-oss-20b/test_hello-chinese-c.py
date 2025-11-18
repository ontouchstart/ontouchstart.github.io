import re
from playwright.sync_api import Page, expect

from mlx_lm import generate, load

checkpoint = "openai/gpt-oss-20b"

model, tokenizer = load(path_or_hf_repo=checkpoint)

url = "https://gist.githubusercontent.com/ontouchstart/45f934b962313b3679c88e0477a261b7/raw/753dbb6b9ecad12d71c2ac2a4173371af0b69908/hello-world-chinese-c.md"

def test_content(page: Page):
    page.goto(url)
    page_content = page.locator("body").text_content()
    print(page_content)

def test_generate(page: Page):
    page.goto(url)
    prompt = page.locator("body").text_content()
    conversation = [{"role": "user", "content": prompt}]
    prompt = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)
    response = generate( model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=1024,verbose=True)
    print(response)
