from playwright.sync_api import Page, expect

url = "http://127.0.0.1:8000/docs"

prompt = "What is Fast API ?"
timeout = 5 * 60 * 1000  # 5 minutes


def test_get_tokens(page: Page) -> None:
    page.goto(url)
    page.get_by_role("button", name="GET /tokens Get Tokens").click()
    page.get_by_role("button", name="Try it out").click()
    page.get_by_role("textbox", name="prompt").click()
    page.get_by_role("textbox", name="prompt").fill(prompt)
    page.get_by_role("button", name="Execute").click()
    page.screenshot(path="get_tokens-request.png")
    page.get_by_role("cell", name='Response body Download { "').click(timeout=timeout)
    page.screenshot(path="get_tokens-response.png")


def test_get_generate(page: Page) -> None:
    page.goto(url)
    page.get_by_role("button", name="GET /generate Get Generate").click()
    page.get_by_role("button", name="Try it out").click()
    page.get_by_role("textbox", name="prompt").click()
    page.get_by_role("textbox", name="prompt").fill(prompt)
    page.get_by_role("button", name="Execute").click()
    page.screenshot(path="get_generate-request.png")
    page.get_by_role("cell", name='Response body Download { "').click(timeout=timeout)
    page.screenshot(path="get_generate-response.png")


def test_post_tokens(page: Page) -> None:
    page.goto(url)
    page.get_by_role("button", name="POST /tokens Post Tokens").click()
    page.get_by_role("button", name="Try it out").click()
    page.get_by_text('{ "content": "string" ').fill(
        '{\n  "content": "What is ChatGPT?"}\n'
    )

    page.get_by_role("button", name="Execute").click()
    page.screenshot(path="post_tokens-request.png")
    page.get_by_role("cell", name='Response body Download { "').click(timeout=timeout)
    page.screenshot(path="post_tokens-response.png")


def test_post_generate(page: Page) -> None:
    page.goto(url)
    page.get_by_role("button", name="POST /generate Post Generate").click()
    page.get_by_role("button", name="Try it out").click()
    # page.pause()
    page.get_by_text('{ "content": "string" ').fill(
        '{\n  "content": "What is ChatGPT?"}\n'
    )
    page.get_by_role("button", name="Execute").click()
    page.screenshot(path="post_generate-request.png")
    page.get_by_role("cell", name='Response body Download { "').click(timeout=timeout)
    page.screenshot(path="post_generate-response.png")
