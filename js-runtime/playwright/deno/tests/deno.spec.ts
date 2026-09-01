import { test, expect } from '@playwright/test';

test('h1', async ({ page }) => {
  await page.goto('http://deno-react:5173');
  console.log('playwright', await page.locator('h1').innerText());
});

