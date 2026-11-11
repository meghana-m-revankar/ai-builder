import { test, expect } from '@playwright/test';

test.describe('Navigation and UI', () => {
  test('TC-UI-001 all menu links work', async ({ page }) => {
    await page.goto('/');
    const links = ['index.html', 'shop.html', 'product.html', 'cart.html', 'track.html', 'dashboard.html'];
    for (const link of links) {
      await page.getByRole('link', { name: new RegExp(link.split('.')[0], 'i') }).first().click();
      await expect(page).toHaveURL(new RegExp(link));
    }
  });

  test('TC-UI-002 responsive layout', async ({ page }) => {
    const sizes = [375, 768, 1440];
    for (const width of sizes) {
      await page.setViewportSize({ width, height: 800 });
      await page.goto('/');
      await expect(page.locator('body')).not.toHaveCSS('overflow-x', 'hidden');
      if (width < 992) {
        await expect(page.getByRole('button', { name: 'Menu' })).toBeVisible();
      }
    }
  });
});
