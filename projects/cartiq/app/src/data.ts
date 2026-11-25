// SAMPLE data - replace with your real plans (or load them from your API in src/api.ts).
export type Item = { id: string; title: string; description: string; price: string; sample: boolean };
export const businessName = "CartIq";
export const items: Item[] = [
  {
    "id": "1",
    "title": "Starter",
    "description": "For personal sites and small projects.",
    "price": "from ₹XXX/mo",
    "sample": true
  },
  {
    "id": "2",
    "title": "Business",
    "description": "More power, daily backups and priority support.",
    "price": "from ₹XXX/mo",
    "sample": true
  },
  {
    "id": "3",
    "title": "Pro",
    "description": "Dedicated resources for growing teams.",
    "price": "from ₹XXX/mo",
    "sample": true
  },
  {
    "id": "4",
    "title": "Enterprise",
    "description": "Custom limits, SLA and onboarding.",
    "price": "Contact us",
    "sample": true
  }
];
