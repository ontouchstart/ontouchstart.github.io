import { test, expect } from '@playwright/test';

test('h1', async ({ page }) => {
  await page.goto('http://bun-react:3000');
  console.log('playwright', await page.locator('h1').innerText());
});

