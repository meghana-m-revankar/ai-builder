import { test, expect } from '@playwright/test';

test.describe('Navigation', () => {
  test('TC-UI-001 All menu links work', async ({ page }) => {
    await page.goto('/');
    await page.getByRole('link', { name: 'Menu' }).click();
    await expect(page).toHaveURL(/.*menu.html/);
    await page.getByRole('link', { name: 'Visit Us' }).click();
    await expect(page).toHaveURL(/.*contact.html/);
  });
});

test.describe('Responsive', () => {
  test('TC-UI-002 Responsive layout', async ({ page }) => {
    const viewports = [375, 768, 1440];
    for (const width of viewports) {
      await page.setViewportSize({ width, height: 800 });
      await page.goto('/');
      // Check for horizontal scroll (basic check)
      const isScrollable = await page.evaluate(() => document.body.scrollWidth > window.innerWidth);
      expect(isScrollable).toBe(false);
    }
  });
});

test.describe('Content Checks', () => {
  test('TC-UI-008 Contact page has required info', async ({ page }) => {
    await page.goto('/contact.html');
    await expect(page.getByText('123 Brigade Road')).toBeVisible();
    await expect(page.getByText('7 AM - 10 PM')).toBeVisible();
  });
});
