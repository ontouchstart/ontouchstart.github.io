import re
from playwright.sync_api import Page, expect

from mlx_lm import generate, load

checkpoint = "openai/gpt-oss-20b"

model, tokenizer = load(path_or_hf_repo=checkpoint)

url = "https://karpathy.medium.com/software-2-0-a64152b37c35"

def test_content(page: Page):
    page.goto(url);

    title = page.get_by_test_id("storyTitle")
    expect(title).to_be_visible()

    article = page.locator("div").nth(0)
    expect(article).to_be_visible()
    article_content = article.text_content()
#    print(article_content)
    prompt = article_content

    conversation = [{"role": "user", "content": prompt}]
    prompt = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)
    response = generate( model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=1024*16,verbose=True)
    print(response)
