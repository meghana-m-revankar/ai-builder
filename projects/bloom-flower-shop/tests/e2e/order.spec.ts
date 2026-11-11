import { test, expect } from '@playwright/test';

test.describe('Order Form', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/order/b-001');
  });

  test('TC-UI-003 main form saves a valid booking', async ({ page }) => {
    await page.getByLabel('Customer Name').fill('Aisha Al Mansoori');
    await page.getByLabel('Phone').fill('+971 50 123 4567');
    await page.getByLabel('Delivery Date').fill('2023-12-01');
    await page.getByRole('button', { name: 'Place Order' }).click();
    await expect(page.getByText('Order placed successfully')).toBeVisible();
  });

  test('TC-UI-004 Main form, empty required fields', async ({ page }) => {
    await page.getByRole('button', { name: 'Place Order' }).click();
    await expect(page.getByText('Name is required')).toBeVisible();
  });
});
