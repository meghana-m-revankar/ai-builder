import { test, expect } from '@playwright/test';

test.describe('Navigation', () => {
  test('TC-UI-001 all menu links work', async ({ page }) => {
    await page.goto('/');
    const links = ['index.html', 'pos.html', 'orders.html', 'dashboard.html'];
    for (const link of links) {
      const navLink = page.getByRole('link', { name: new RegExp(link.replace('.html', ''), 'i') }).first();
      await navLink.click();
      await expect(page).toHaveURL(new RegExp(link));
    }
  });

  test('TC-UI-002 responsive layout', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 812 });
    await page.goto('/');
    const menuButton = page.getByRole('button', { name: 'Menu' });
    await expect(menuButton).toBeVisible();
    await menuButton.click();
    await expect(page.locator('#mobile-menu')).toBeVisible();
  });
});
