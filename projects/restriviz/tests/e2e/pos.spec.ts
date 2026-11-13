import { test, expect } from '@playwright/test';

test.describe('POS System', () => {
  test('TC-UI-003 main form saves a valid booking', async ({ page }) => {
    await page.goto('/pos.html');
    // Simplified interaction
    await page.click('text=Masala Chai');
    await page.getByRole('button', { name: 'Process Payment' }).click();
    // Assuming a toast or similar feedback
    await expect(page.locator('body')).toContainText('Thanks'); 
  });
});
