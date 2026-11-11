import { test, expect } from '@playwright/test';

test('TC-UI-003 main form saves a valid POS order', async ({ page }) => {
  await page.goto('/pos');
  await page.getByRole('button', { name: 'Latte' }).click();
  await page.getByRole('button', { name: 'Pay Cash' }).click();
  await expect(page.getByText('Order completed')).toBeVisible();
});
