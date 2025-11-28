from playwright.sync_api import Page, expect

url = "http://127.0.0.1:8000/docs"

prompt = "What is Fast API ?" 
def test_tokens(page: Page) -> None:
    page.goto(url)
    page.get_by_role("button", name="GET /tokens Get Tokens").click()
    page.get_by_role("button", name="Try it out").click()
    page.get_by_role("textbox", name="prompt").click()
    page.get_by_role("textbox", name="prompt").fill(prompt)
    page.get_by_role("button", name="Execute").click()
    page.screenshot(path="screenshot-tokens-request.png")
    page.get_by_role("cell", name="Response body Download { \"").click(timeout=60000)
    page.screenshot(path="screenshot-tokens-response.png")

def test_generate(page: Page) -> None:
    page.goto(url)
    page.get_by_role("button", name="GET /generate Get Generate").click()
    page.get_by_role("button", name="Try it out").click()
    page.get_by_role("textbox", name="prompt").click()
    page.get_by_role("textbox", name="prompt").fill(prompt)
    page.get_by_role("button", name="Execute").click()
    page.screenshot(path="screenshot-generate-request.png")
    page.get_by_role("cell", name="Response body Download { \"").click(timeout=60000)
    page.screenshot(path="screenshot-generate-response.png")
    
