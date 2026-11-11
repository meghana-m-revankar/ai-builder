import { test, expect } from '@playwright/test';

test('TC-UI-001 all menu links work', async ({ page }) => {
  await page.goto('/');
  const links = ['Home', 'About', 'Projects', 'Skills', 'Contact'];
  for (const name of links) {
    await page.getByRole('link', { name }).click();
    await expect(page).toHaveURL(new RegExp(`#${name.toLowerCase()}`));
  }
});

test('TC-UI-006 theme toggle persists', async ({ page }) => {
  await page.goto('/');
  const toggle = page.getByRole('button', { name: /toggle theme/i });
  await toggle.click();
  await page.reload();
  await expect(page.locator('html')).toHaveClass(/dark/);
});

test('TC-UI-003 main form sends valid data', async ({ page }) => {
  await page.goto('/#contact');
  await page.getByLabel('Name').fill('Meghana');
  await page.getByLabel('Email').fill('meghana@example.com');
  await page.getByLabel('Message').fill('Hello!');
  await page.getByRole('button', { name: /send/i }).click();
  await expect(page.getByText(/thank you/i)).toBeVisible();
});
