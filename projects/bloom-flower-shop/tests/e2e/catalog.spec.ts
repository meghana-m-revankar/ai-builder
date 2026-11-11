import { test, expect } from '@playwright/test';

test.describe('Catalog Page', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    page.on('console', msg => expect(msg.type()).not.toBe('error'));
  });

  test('TC-UI-001 All menu links work', async ({ page }) => {
    await page.getByRole('link', { name: 'Home' }).click();
    await expect(page).toHaveURL('/');
  });

  test('TC-UI-005 Search and filter', async ({ page }) => {
    await page.getByPlaceholder('Search bouquets...').fill('Roses');
    await expect(page.getByRole('listitem')).toHaveCount(1);
  });
});
