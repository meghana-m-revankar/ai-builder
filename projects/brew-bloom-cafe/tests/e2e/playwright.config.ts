import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './',
  baseURL: process.env.BASE_URL || 'http://localhost:8080',
  use: {
    browserName: 'chromium',
    viewport: { width: 375, height: 812 },
    screenshot: 'only-on-failure',
  },
  projects: [
    { name: 'desktop', use: { ...devices['Desktop Chrome'] } },
    { name: 'mobile', use: { ...devices['iPhone 13'] } },
  ],
});
