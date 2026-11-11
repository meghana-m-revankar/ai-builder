import { test, expect } from '@playwright/test';

test.describe('Portfolio Page', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('TC-UI-001 All menu links work', async ({ page }) => {
    const navLinks = ['Home', 'About', 'Projects', 'Skills', 'Contact'];
    for (const name of navLinks) {
      await page.getByRole('link', { name }).click();
      await expect(page.getByRole('region', { name: name.toLowerCase() })).toBeVisible();
    }
  });

  test('TC-UI-002 Responsive layout', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 812 });
    await expect(page.getByRole('button', { name: /toggle navigation/i })).toBeVisible();
  });

  test('TC-UI-003 Main form, valid data', async ({ page }) => {
    await page.getByLabel('Name').fill('John Doe');
    await page.getByLabel('Email').fill('john@example.com');
    await page.getByLabel('Message').fill('Hello there!');
    await page.getByRole('button', { name: 'Send' }).click();
    // Assuming a success message appears
    await expect(page.getByText(/thank you/i)).toBeVisible();
  });

  test('TC-UI-004 Main form, empty required fields', async ({ page }) => {
    await page.getByRole('button', { name: 'Send' }).click();
    const nameInput = page.getByLabel('Name');
    const isInvalid = await nameInput.evaluate((el: HTMLInputElement) => !el.checkValidity());
    expect(isInvalid).toBe(true);
  });

  test('TC-UI-006 Theme switch', async ({ page }) => {
    const toggle = page.getByRole('button', { name: /toggle theme/i });
    await toggle.click();
    await expect(page.locator('body')).toHaveAttribute('data-bs-theme', 'dark');
  });

  test('TC-SEC-001 Script injection', async ({ page }) => {
    const payload = '<script>alert(1)</script>';
    await page.getByLabel('Name').fill(payload);
    await page.getByRole('button', { name: 'Send' }).click();
    await expect(page.getByText(payload)).toBeVisible();
  });
});
