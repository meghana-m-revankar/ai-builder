import { devices, PlaywrightTestConfig } from '@playwright/test';

const config: PlaywrightTestConfig = {
  testDir: '.',
  baseURL: process.env.BASE_URL || 'http://localhost:8080',
  use: {
    browserName: 'chromium',
    screenshot: 'only-on-failure',
  },
  projects: [
    { name: 'Desktop', use: { ...devices['Desktop Chrome'] } },
    { name: 'Mobile', use: { ...devices['iPhone 13'] } },
  ],
};
export default config;
