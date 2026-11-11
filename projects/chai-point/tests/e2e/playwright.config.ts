import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './',
  baseURL: process.env.BASE_URL || 'http://localhost:8080',
  use: {
    browserName: 'chromium',
    viewport: { width: 1280, height: 720 },
    screenshot: 'only-on-failure',
  },
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
    {
      name: 'mobile',
      use: { ...devices['iPhone 13'] },
    },
  ],
});
