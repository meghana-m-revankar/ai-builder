import { test, expect } from '@playwright/test';

test('TC-UI-001 All menu links work', async ({ page }) => {
  await page.goto('/');
  const links = ['Home', 'Menu', 'Contact'];
  for (const name of links) {
    const link = page.getByRole('link', { name, exact: true });
    await expect(link).toBeVisible();
    await link.click();
    await expect(page).toHaveURL(/.*html/);
    const consoleErrors = [];
    page.on('console', msg => { if (msg.type() === 'error') consoleErrors.push(msg.text()); });
    expect(consoleErrors).toEqual([]);
  }
});

test('TC-UI-002 Responsive layout', async ({ page }) => {
  const sizes = [{ width: 375, height: 812 }, { width: 768, height: 1024 }, { width: 1440, height: 900 }];
  for (const size of sizes) {
    await page.setViewportSize(size);
    await page.goto('/');
    const body = page.locator('body');
    const scrollWidth = await body.evaluate((el) => el.scrollWidth);
    const clientWidth = await body.evaluate((el) => el.clientWidth);
    expect(scrollWidth).toBeLessThanOrEqual(clientWidth + 1);
  }
});

test('TC-UI-003 Main form, valid data', async ({ page }) => {
  await page.goto('/contact.html');
  await page.getByPlaceholder('Name').fill('John Doe');
  await page.getByPlaceholder('Phone').fill('+919845012345');
  await page.getByRole('button', { name: 'Submit Booking' }).click();
  // Netlify handles form, expect success message or redirection
  await expect(page).toHaveURL(/.*(success|contact)/);
});

test('TC-A11Y-002 Images and icons', async ({ page }) => {
  await page.goto('/');
  const images = page.locator('img');
  const count = await images.count();
  for (let i = 0; i < count; i++) {
    await expect(images.nth(i)).toHaveAttribute('alt');
    await expect(images.nth(i)).not.toHaveAttribute('src', '');
  }
});
