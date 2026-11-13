"use strict";
tailwind.config = {
  theme: {
    extend: {
      colors: {
        brand: { 
          900: "#064E3B", // emerald-900
          700: "#166534", // emerald-800
          500: "#10B981", // emerald-500
          100: "#FEFCE8", // yellow-50
        },
        accent: { 500: "#F59E0B" }, // amber-500
        ink: { 900: "#1F2937", 600: "#4B5563" },
        canvas: "#FEFCE8",
        line: "#D1FAE5"
      },
      fontFamily: {
        display: ['"Plus Jakarta Sans"', "system-ui", "sans-serif"],
        body: ["Inter", "system-ui", "sans-serif"],
        mono: ['"JetBrains Mono"', "ui-monospace", "monospace"]
      },
      boxShadow: { soft: "0 1px 2px rgba(6, 78, 59, .06), 0 12px 32px rgba(6, 78, 59, .08)" },
      borderRadius: { xl2: "20px" }
    }
  }
};
