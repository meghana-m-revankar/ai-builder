import { test, expect } from '@playwright/test';

test.describe('Navigation', () => {
  test('TC-UI-001 All menu links work', async ({ page }) => {
    await page.goto('/');
    const links = ['Home', 'Shop', 'About', 'Contact'];
    for (const label of links) {
      await page.getByRole('link', { name: label, exact: true }).click();
      await expect(page).toHaveURL(/.*\.html/);
    }
  });
});
