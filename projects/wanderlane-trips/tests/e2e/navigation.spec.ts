import { test, expect } from '@playwright/test';

test('TC-UI-001 All menu links work', async ({ page }) => {
  await page.goto('/');
  const links = ['Home', 'Packages', 'Contact'];
  for (const label of links) {
    await page.getByRole('link', { name: label, exact: true }).click();
    await expect(page).toHaveURL(/.*\.html/);
  }
});

test('TC-UI-002 Responsive layout', async ({ page }) => {
  await page.setViewportSize({ width: 375, height: 812 });
  await page.goto('/');
  await expect(page.getByRole('button', { name: /menu/i })).toBeVisible();
  
  await page.setViewportSize({ width: 1440, height: 900 });
  await expect(page.getByRole('link', { name: 'Home' })).toBeVisible();
});

test('TC-SEC-001 Script injection', async ({ page }) => {
  await page.goto('/contact.html');
  await page.getByLabel('Name').fill('<script>alert(1)</script>');
  await page.getByRole('button', { name: 'Submit' }).click();
  const content = await page.textContent('body');
  expect(content).not.toContain('alert(1)');
});
