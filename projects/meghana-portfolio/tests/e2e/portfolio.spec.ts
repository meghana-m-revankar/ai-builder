import { test, expect } from '@playwright/test';

test('TC-UI-001 All menu links work', async ({ page }) => {
  await page.goto('/');
  const links = ['About', 'Projects', 'Skills', 'Contact'];
  for (const link of links) {
    await page.getByRole('link', { name: link }).click();
    await expect(page.locator(`#${link.toLowerCase()}`)).toBeVisible();
  }
});

test('TC-UI-003 Contact form, valid data', async ({ page }) => {
  await page.goto('/');
  await page.getByLabel('Name').fill('Test User');
  await page.getByLabel('Email').fill('test@example.com');
  await page.getByLabel('Message').fill('Hello Meghana!');
  await page.getByRole('button', { name: 'Send Message' }).click();
  await expect(page.getByText('Thank you')).toBeVisible();
});

test('TC-UI-005 Theme toggle works', async ({ page }) => {
  await page.goto('/');
  const html = page.locator('html');
  await page.getByRole('button', { name: /toggle theme/i }).click();
  await expect(html).toHaveClass(/dark/);
});
