import { test, expect } from '@playwright/test';

test.describe('Navigation', () => {
  test('TC-UI-001 All menu links work', async ({ page }) => {
    await page.goto('/');
    const links = ['index.html', 'shop.html', 'product.html', 'cart.html', 'track.html', 'dashboard.html'];
    for (const href of links) {
      await page.getByRole('link', { name: href.replace('.html', '').replace('-', ' ') }).first().click();
      await expect(page).toHaveURL(new RegExp(href));
    }
  });

  test('TC-UI-002 Responsive layout', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 812 });
    await page.goto('/');
    await expect(page.getByLabel('Menu')).toBeVisible();
    await page.getByLabel('Menu').click();
    await expect(page.locator('#mobile-menu')).toBeVisible();
  });
});
