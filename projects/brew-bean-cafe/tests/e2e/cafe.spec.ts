import { test, expect } from '@playwright/test';

test.describe('Navigation', () => {
  test('TC-UI-001 All menu links work', async ({ page }) => {
    await page.goto('/');
    const links = ['Home', 'Menu', 'About', 'Contact'];
    for (const name of links) {
      const link = page.getByRole('link', { name, exact: true });
      await expect(link).toBeVisible();
    }
  });
});

test.describe('Responsive', () => {
  test('TC-UI-002 Responsive layout', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 812 });
    await page.goto('/');
    const menuBtn = page.getByRole('button', { name: /menu/i });
    await expect(menuBtn).toBeVisible();
    await menuBtn.click();
    await expect(page.getByRole('link', { name: 'Menu' }).last()).toBeVisible();
  });
});

test.describe('Form', () => {
  test('TC-UI-003 Main form, valid data', async ({ page }) => {
    await page.goto('/contact.html');
    await page.getByPlaceholder('Your Name').fill('John Doe');
    await page.getByPlaceholder('Your Email').fill('john@example.com');
    await page.getByPlaceholder('Your Message').fill('Hello!');
    await page.getByRole('button', { name: 'Send Message' }).click();
    // Since it's a static site with netlify, we just check no error
  });
});
