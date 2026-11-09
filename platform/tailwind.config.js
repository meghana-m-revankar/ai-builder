tailwind.config = {
  theme: {
    extend: {
      colors: {
        brand: { 900: "#1E1B4B", 700: "#4338CA", 500: "#6366F1", 100: "#EEF0FF" },
        accent: { 500: "#F97316" },
        ink: { 900: "#0F172A", 600: "#475569" },
        canvas: "#F7F7FB",
        line: "#E2E8F0"
      },
      fontFamily: {
        display: ['"Plus Jakarta Sans"', "system-ui", "sans-serif"],
        body: ["Inter", "system-ui", "sans-serif"],
        mono: ['"JetBrains Mono"', "ui-monospace", "monospace"]
      },
      fontSize: { hero: "var(--fs-hero)", h2: "var(--fs-h2)", lead: "var(--fs-lead)" },
      boxShadow: { soft: "0 1px 2px rgba(15,23,42,.06), 0 12px 32px rgba(15,23,42,.08)" },
      borderRadius: { xl2: "20px" }
    }
  }
};
