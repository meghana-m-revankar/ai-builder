import { test, expect } from '@playwright/test';

test('TC-UI-001 all menu links work', async ({ page }) => {
  await page.goto('/');
  const links = ['Dashboard', 'Menu Management', 'POS Checkout', 'Payments'];
  for (const link of links) {
    await page.getByRole('link', { name: link }).first().click();
    await expect(page).toHaveURL(/.*\.html/);
  }
});

test('TC-UI-002 responsive layout', async ({ page }) => {
  await page.setViewportSize({ width: 375, height: 812 });
  await page.goto('/');
  await expect(page.getByRole('button', { name: 'Menu' })).toBeVisible();
  
  await page.setViewportSize({ width: 1440, height: 900 });
  await expect(page.getByRole('button', { name: 'Menu' })).not.toBeVisible();
});
