tailwind.config = {
  theme: {
    extend: {
      colors: {
        brand: { 900: "#064E3B", 700: "#059669", 500: "#10B981", 100: "#D1FAE5" },
        accent: { 500: "#F59E0B" },
        ink: { 900: "#111827", 600: "#4B5563" },
        canvas: "#F9FAFB",
        line: "#E5E7EB"
      },
      fontFamily: {
        display: ['"Plus Jakarta Sans"', "system-ui", "sans-serif"],
        body: ["Inter", "system-ui", "sans-serif"],
        mono: ['"JetBrains Mono"', "ui-monospace", "monospace"]
      },
      boxShadow: { soft: "0 1px 2px rgba(17,24,39,.06), 0 12px 32px rgba(17,24,39,.08)" },
      borderRadius: { xl2: "20px" }
    }
  }
};
