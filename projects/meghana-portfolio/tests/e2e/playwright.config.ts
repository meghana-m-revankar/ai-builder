import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './',
  baseURL: process.env.BASE_URL || 'http://localhost:3000',
  use: {
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
  },
  projects: [
    { name: 'chromium', use: { ...devices['Desktop Chrome'] } },
    { name: 'mobile', use: { ...devices['iPhone 13'] } },
  ],
});
