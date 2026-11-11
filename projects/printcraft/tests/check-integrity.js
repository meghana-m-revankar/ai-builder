const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

const siteDir = 'site';
const files = fs.readdirSync(siteDir).filter(f => f.endsWith('.html'));

files.forEach(file => {
  const dom = new JSDOM(fs.readFileSync(path.join(siteDir, file), 'utf8'));
  const doc = dom.window.document;

  // Check relatives
  [...doc.querySelectorAll('a')].forEach(a => {
    const href = a.getAttribute('href');
    if (href && !href.startsWith('#') && !href.startsWith('mailto') && (href.startsWith('/') || href.includes('://'))) {
      throw new Error(`Absolute path or external link found in ${file}: ${href}`);
    }
  });

  // Check images
  [...doc.querySelectorAll('img')].forEach(img => {
    if (!img.getAttribute('src') || !img.getAttribute('alt')) {
      throw new Error(`Image missing src/alt in ${file}`);
    }
  });
});
