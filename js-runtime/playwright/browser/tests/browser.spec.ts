import { test, expect } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto('https://ontouchstart.github.io/js-runtime/browser');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/Browser/);
  await page.getByRole('button', { name: 'Get Values' }).click();

});

test('get navigator', async ({page }) => {
  const navData = await page.evaluate(() => {
    const data = {};
    for (let key in navigator) {
      const value = navigator[key];
      // Only include properties that are not functions and not objects
      // (to avoid circular references and non-serializable types)
      if (typeof value !== 'function' && typeof value !== 'object') {
        data[key] = value;
      }
    }
    return data;
  });

  console.log(navData);
});

test('get values', async ({ page }) => {
  await page.goto('https://ontouchstart.github.io/js-runtime/browser');
  console.log('playwright', await page.locator('#appname').innerText());
  console.log('playwright', await page.locator('#appcodename').innerText());
  console.log('playwright', await page.locator('#appversion').innerText());
  await page.getByRole('button', { name: 'Get Values' }).click();
  console.log('playwright', 'GetValues');
  console.log('playwright', await page.locator('#appname').innerText());
  console.log('playwright', await page.locator('#appcodename').innerText());
  console.log('playwright', await page.locator('#appversion').innerText());
});
