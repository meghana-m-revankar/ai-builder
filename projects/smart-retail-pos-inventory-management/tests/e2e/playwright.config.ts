import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './',
  baseURL: process.env.BASE_URL || 'http://localhost:3000',
  use: {
    browserName: 'chromium',
    viewport: { width: 1280, height: 720 },
    screenshot: 'only-on-failure',
  },
  projects: [
    { name: 'Desktop', use: { ...devices['Desktop Chrome'] } },
    { name: 'Mobile', use: { ...devices['iPhone 13'] } },
  ],
});
