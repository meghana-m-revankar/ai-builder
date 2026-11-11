import { test, expect } from '@playwright/test';

test('TC-UI-001 All menu links work', async ({ page }) => {
  await page.goto('/');
  const links = ['Home', 'POS System', 'Analytics', 'Inventory'];
  for (const name of links) {
    await page.getByRole('link', { name }).click();
    await expect(page).not.toHaveURL(/.*404/);
    await page.goBack();
  }
});

test('TC-UI-003 main form saves a valid bill', async ({ page }) => {
  await page.goto('/pos.html');
  // Mock add to cart logic (assuming element roles)
  await page.getByRole('button', { name: /Add/i }).first().click();
  await page.getByRole('button', { name: /Charge/i }).click();
  await expect(page.getByText(/Receipt/i)).toBeVisible();
});
