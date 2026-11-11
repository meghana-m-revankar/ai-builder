import { test, expect } from '@playwright/test';

test.describe('Contact Form', () => {
  test('TC-UI-003 main form, valid data', async ({ page }) => {
    await page.goto('/contact.html');
    await page.getByLabel('Name').fill('John Doe');
    await page.getByLabel('Message').fill('Hello flower shop');
    await page.getByRole('button', { name: 'Send Message' }).click();
    // Netlify form submission handled by data-netlify="true"
  });

  test('TC-UI-004 main form, empty required fields', async ({ page }) => {
    await page.goto('/contact.html');
    await page.getByRole('button', { name: 'Send Message' }).click();
    const nameInput = page.getByLabel('Name');
    await expect(nameInput).toBeVisible();
    // Check for browser validation
    const isValidationMessageShown = await nameInput.evaluate((el: HTMLInputElement) => !el.checkValidity());
    expect(isValidationMessageShown).toBe(true);
  });
});
