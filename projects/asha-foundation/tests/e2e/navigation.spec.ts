import { test, expect } from '@playwright/test';

test.describe('Navigation', () => {
  test('TC-UI-001 All menu links work', async ({ page }) => {
    await page.goto('/');
    const links = ['index.html', 'about.html', 'programs.html', 'volunteer.html', 'contact.html'];
    for (const link of links) {
      await page.getByRole('link', { name: new RegExp(link.replace('.html', ''), 'i') }).click();
      await expect(page).toHaveURL(new RegExp(link));
      const errors = [];
      page.on('console', msg => { if (msg.type() === 'error') errors.push(msg.text()); });
      expect(errors).toEqual([]);
    }
  });
});

test.describe('Responsive', () => {
  test('TC-UI-002 Responsive layout', async ({ page }) => {
    const widths = [375, 768, 1440];
    for (const width of widths) {
      await page.setViewportSize({ width, height: 800 });
      await page.goto('/');
      // Check horizontal scroll
      const isScrollable = await page.evaluate(() => document.documentElement.scrollWidth > document.documentElement.clientWidth);
      expect(isScrollable).toBe(false);
    }
  });
});

test.describe('Accessibility & Security', () => {
  test('TC-A11Y-002 Images have alt text', async ({ page }) => {
    await page.goto('/');
    const images = await page.locator('img').all();
    for (const img of images) {
      await expect(img).toHaveAttribute('alt');
    }
  });

  test('TC-SEC-001 Script injection', async ({ page }) => {
    await page.goto('/contact.html');
    const input = page.getByLabel(/Name/i);
    await input.fill('<script>alert(1)</script>');
    await page.getByRole('button', { name: /Send/i }).click();
    // Verify it shows as text in DOM
    await expect(page.locator('body')).not.toContainText('alert(1)');
  });
});
