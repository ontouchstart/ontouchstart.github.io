import { test, expect } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto('https://ontouchstart.github.io/js-runtime/browser');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/Browser/);
  await page.getByRole('button', { name: 'Get Values' }).click();

});

test('get values', async ({ page }) => {
  await page.goto('https://ontouchstart.github.io/js-runtime/browser');
  console.log(await page.locator('#appname').innerText());
  console.log(await page.locator('#appcodename').innerText());
  console.log(await page.locator('#appversion').innerText());
  await page.getByRole('button', { name: 'Get Values' }).click();
  console.log(await page.locator('#appname').innerText());
  console.log(await page.locator('#appcodename').innerText());
  console.log(await page.locator('#appversion').innerText());
});
