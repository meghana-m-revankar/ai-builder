import { test, expect } from '@playwright/test';

test.describe('Navigation and UI', () => {
  test('TC-UI-001 All menu links work', async ({ page }) => {
    await page.goto('/');
    const links = ['Home', 'Menu', 'About Us', 'Gallery', 'Contact & Reservations'];
    for (const link of links) {
      await page.getByRole('link', { name: link }).first().click();
      await expect(page).not.toHaveURL(/404/);
    }
  });

  test('TC-UI-002 Responsive layout', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 812 });
    await page.goto('/');
    const menuButton = page.getByRole('button', { name: 'Menu' });
    await expect(menuButton).toBeVisible();
    await menuButton.click();
    await expect(page.locator('#mobile-menu')).toBeVisible();
  });

  test('TC-UI-003 Main form, valid data', async ({ page }) => {
    await page.goto('/contact.html');
    await page.getByPlaceholder('Your Name').fill('Test User');
    await page.getByPlaceholder('Phone Number').fill('9876543210');
    await page.getByRole('button', { name: 'Confirm Reservation' }).click();
    await expect(page.locator('text=Thanks!')).toBeVisible();
  });

  test('TC-A11Y-002 Images and icons', async ({ page }) => {
    await page.goto('/');
    const images = await page.locator('img').all();
    for (const img of images) {
      await expect(img).toHaveAttribute('alt');
    }
  });
});
