import { test, expect } from '@playwright/test';

test.describe('Navigation', () => {
  test('TC-UI-001 All menu links work', async ({ page }) => {
    await page.goto('/');
    const navLinks = page.getByRole('navigation').getByRole('link');
    const count = await navLinks.count();
    for (let i = 0; i < count; i++) {
      const link = navLinks.nth(i);
      const url = await link.getAttribute('href');
      await link.click();
      await expect(page).toHaveURL(new RegExp(url!));
      await page.goto('/');
    }
  });

  test('TC-UI-002 Responsive layout', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 812 });
    await page.goto('/');
    await expect(page.getByRole('button', { name: /menu/i })).toBeVisible();
    await page.setViewportSize({ width: 1440, height: 900 });
    await expect(page.getByRole('button', { name: /menu/i })).not.toBeVisible();
  });
});
