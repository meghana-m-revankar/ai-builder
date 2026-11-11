import { test, expect } from '@playwright/test';

test('TC-UI-001 navigation scrolls to sections', async ({ page }) => {
  await page.goto('/');
  await page.getByRole('link', { name: 'About' }).click();
  await expect(page.getByRole('heading', { name: /about/i })).toBeInViewport();
});

test('TC-UI-003 contact form shows success', async ({ page }) => {
  await page.goto('/');
  await page.getByLabel('Name').fill('John Doe');
  await page.getByLabel('Email').fill('john@example.com');
  await page.getByLabel('Message').fill('Hello!');
  await page.getByRole('button', { name: 'Send' }).click();
  await expect(page.getByText('Thank you')).toBeVisible();
});

test('TC-UI-006 theme toggle works', async ({ page }) => {
  await page.goto('/');
  const html = page.locator('html');
  await expect(html).toHaveClass(/dark/);
  await page.getByRole('button', { name: /toggle theme/i }).click();
  await expect(html).not.toHaveClass(/dark/);
});

test('TC-SEC-001 script injection is prevented', async ({ page }) => {
  await page.goto('/');
  await page.getByLabel('Message').fill('<script>alert(1)</script>');
  await page.getByRole('button', { name: 'Send' }).click();
  // Ensure the page didn't execute the script (alert would crash test)
  await expect(page.getByText('<script>alert(1)</script>')).toBeVisible();
});
