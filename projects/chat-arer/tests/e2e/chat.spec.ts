import { test, expect } from '@playwright/test';

test('TC-UI-003 main form sends a message', async ({ page }) => {
  await page.goto('/');
  await page.getByText('Aisha Al Mansoori').click();
  const input = page.locator('#message-input');
  await input.fill('Hello Test');
  await page.getByRole('button', { name: '' }).filter({ has: page.locator('i[data-lucide="send"]') }).click();
  await expect(page.getByText('Hello Test')).toBeVisible();
});

test('TC-UI-001 clicking contact loads chat', async ({ page }) => {
  await page.goto('/');
  await page.getByText('Omar Haddad').click();
  await expect(page.locator('#chat-name')).toHaveText('Omar Haddad');
});

test('TC-SEC-001 handles XSS input as text', async ({ page }) => {
  await page.goto('/');
  await page.getByText('Aisha Al Mansoori').click();
  const input = page.locator('#message-input');
  const payload = '<script>alert(1)</script>';
  await input.fill(payload);
  await page.getByRole('button', { has: page.locator('i[data-lucide="send"]') }).click();
  const message = page.locator('.message-bubble').last();
  await expect(message).toHaveText(payload);
});
