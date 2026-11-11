import { test, expect } from '@playwright/test';

test.describe('Meghana Portfolio UI', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('TC-UI-001 All menu links work', async ({ page }) => {
    const navLinks = ['About', 'Projects', 'Skills', 'Contact'];
    for (const link of navLinks) {
      await page.getByRole('link', { name: link }).click();
      await expect(page.locator(`#${link.toLowerCase()}`)).toBeVisible();
    }
  });

  test('TC-UI-003 Contact form, valid data', async ({ page }) => {
    await page.getByLabel('Name').fill('John Doe');
    await page.getByLabel('Email').fill('john@example.com');
    await page.getByLabel('Message').fill('Hello!');
    await page.getByRole('button', { name: 'Send Message' }).click();
    await expect(page.getByText('Thank you, your message was sent!')).toBeVisible();
  });

  test('TC-UI-005 Theme toggle', async ({ page }) => {
    const toggle = page.getByRole('button', { name: /theme/i });
    await toggle.click();
    await expect(page.locator('body')).toHaveClass(/dark-mode/);
  });
});
