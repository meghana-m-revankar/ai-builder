import { test, expect } from '@playwright/test';

test.describe('Smart Retail POS UI', () => {
  test('TC-UI-001 All menu links work', async ({ page }) => {
    await page.goto('/');
    const links = ['Features', 'Dashboard'];
    for (const name of links) {
      await page.getByRole('link', { name: name, exact: true }).click();
      await expect(page).toHaveURL(/.*\.html/);
    }
  });

  test('TC-UI-003 Dashboard KPIs render', async ({ page }) => {
    await page.goto('/dashboard.html');
    const kpis = page.locator('#stats-grid > div');
    await expect(kpis.first()).toBeVisible();
    await expect(page.locator('#inventory-table tr')).toHaveCount(3);
  });

  test('TC-UI-002 Responsive layout', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 667 });
    await page.goto('/');
    // Check for no horizontal scroll
    const isScrollable = await page.evaluate(() => document.documentElement.scrollWidth > document.documentElement.clientWidth);
    expect(isScrollable).toBe(false);
  });

  test('No console errors', async ({ page }) => {
    const errors: string[] = [];
    page.on('console', msg => { if (msg.type() === 'error') errors.push(msg.text()); });
    await page.goto('/');
    expect(errors).toEqual([]);
  });
});
