import { test, expect } from '@playwright/test';

test('TC-UI-001 homepage loads correctly', async ({ page }) => {
  await page.goto('/');
  await expect(page).toHaveTitle(/BrewPoint/);
  const consoleErrors: string[] = [];
  page.on('console', msg => { if (msg.type() === 'error') consoleErrors.push(msg.text()); });
  expect(consoleErrors).toEqual([]);
});
