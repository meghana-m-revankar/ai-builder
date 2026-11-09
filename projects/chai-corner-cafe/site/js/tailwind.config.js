tailwind.config = {
  theme: {
    extend: {
      colors: {
        brand: { 900: "#5D2E1C", 700: "#A0522D", 500: "#CD853F", 100: "#FDF5E6" },
        accent: { 500: "#D2691E" },
        ink: { 900: "#2D1B14", 600: "#6B5B4E" },
        canvas: "#FFFBF6",
        line: "#EADFD3"
      },
      fontFamily: {
        display: ['"Plus Jakarta Sans"', "system-ui", "sans-serif"],
        body: ["Inter", "system-ui", "sans-serif"],
        mono: ['"JetBrains Mono"', "ui-monospace", "monospace"]
      },
      boxShadow: { soft: "0 1px 2px rgba(93,46,28,.06), 0 12px 32px rgba(93,46,28,.08)" },
      borderRadius: { xl2: "20px" }
    }
  }
};
