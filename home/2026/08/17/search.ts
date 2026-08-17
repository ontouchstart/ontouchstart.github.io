import { chromium } from 'playwright';

(async () => {
  const browser = await chromium.launch({ headless: true });
  const page = await browser.newPage();
  await page.goto('https://en.wikipedia.org/wiki/Land%C3%A8s_Lewitin');
  
  await page.waitForTimeout(2000);
  
  const content = await page.content();
  console.log(content);
  
  await browser.close();
})();
