tailwind.config = {
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        brand: { 900: '#0B1B3F', 700: '#1E3A8A', 500: '#3B5BDB', 100: '#E7ECFB' },
        accent: { 500: '#F97316' },
        ink: { 900: '#0F172A', 600: '#475569' },
        canvas: '#F6F7FB',
        surface: '#FFFFFF'
      },
      fontFamily: {
        sans: ['"Plus Jakarta Sans"', 'system-ui', 'sans-serif'],
        mono: ['"JetBrains Mono"', 'monospace']
      }
    }
  }
}
