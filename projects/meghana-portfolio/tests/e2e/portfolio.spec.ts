import { test, expect } from '@playwright/test';

test.describe('Portfolio UI', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('TC-UI-001 All menu links work', async ({ page }) => {
    const links = ['About', 'Projects', 'Skills', 'Contact'];
    for (const link of links) {
      await page.getByRole('link', { name: link }).click();
      await expect(page.locator(`#${link.toLowerCase()}`)).toBeInViewport();
    }
  });

  test('TC-UI-003 Main form, valid data', async ({ page }) => {
    await page.getByLabel('Name').fill('Test User');
    await page.getByLabel('Email').fill('test@example.com');
    await page.getByLabel('Message').fill('Hello!');
    await page.getByRole('button', { name: 'Send' }).click();
    await expect(page.getByText(/thank you/i)).toBeVisible();
  });

  test('TC-UI-005 Theme toggle', async ({ page }) => {
    const html = page.locator('html');
    await page.getByRole('button', { name: /toggle theme/i }).click();
    await expect(html).toHaveClass(/dark/);
  });
});
