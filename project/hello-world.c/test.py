from playwright.sync_api import Page, expect

from mlx_lm import generate, load

checkpoint = "openai/gpt-oss-20b"

model, tokenizer = load(path_or_hf_repo=checkpoint)

url = "https://gist.githubusercontent.com/ontouchstart/5f666f201fc8126b887a1b82f533e50d/raw/348f5131051e237a2fb0459694109fb6229c3a7f/hello.c"

def test_content(page: Page):
    page.goto(url);

    code = page.locator("body").text_content()
    content = "convert following code to python: \n" + code 
    conversation = [{"role": "user", "content": content}]
    prompt = tokenizer.apply_chat_template(conversation=conversation, add_generation_prompt=True)
    print("\n# conversation\n")
    print(conversation)
    print("\n# prompt (token)\n")
    print(prompt)
    print("\n# prompt (decoded)\n")
    print([(id, tokenizer.decode([id])) for id in prompt])
    response = generate( model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=1024*16,verbose=True)
    print("\n# response\n")
    print(response)
