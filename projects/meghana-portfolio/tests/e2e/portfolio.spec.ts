import { test, expect } from '@playwright/test';

test.describe('Portfolio UI', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('TC-UI-001 all menu links work', async ({ page }) => {
    const links = ['About', 'Projects', 'Skills', 'Contact'];
    for (const link of links) {
      await page.getByRole('link', { name: link }).click();
      await expect(page.locator(`#${link.toLowerCase()}`)).toBeInViewport();
    }
  });

  test('TC-UI-003 main form valid data', async ({ page }) => {
    await page.getByLabel('Name').fill('John Doe');
    await page.getByLabel('Email').fill('john@example.com');
    await page.getByLabel('Message').fill('Hello!');
    await page.getByRole('button', { name: 'Send Message' }).click();
    await expect(page.getByText('Thank you, your message was sent!')).toBeVisible();
  });

  test('TC-UI-004 main form empty required fields', async ({ page }) => {
    await page.getByRole('button', { name: 'Send Message' }).click();
    const nameInput = page.getByLabel('Name');
    await expect(nameInput).toBeFocused();
  });
});
