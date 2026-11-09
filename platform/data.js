"use strict";
const heroStats = [
  { value: "3", label: "Required questions" },
  { value: "8+", label: "Sections per page" },
  { value: "~10 min", label: "To first preview" }
];
const trust = [
  { icon: "smartphone", title: "Mobile-ready", text: "Looks right from phone to desktop" },
  { icon: "palette", title: "Your brand", text: "Colours taken from your logo" },
  { icon: "pen-line", title: "Real copy", text: "Written for your business" },
  { icon: "gauge", title: "Fast & clean", text: "Quality-checked before delivery" }
];
const steps = [
  { icon: "message-square-text", title: "Describe", text: "Answer a few plain questions about your business. No technical words." },
  { icon: "layout-template", title: "We design", text: "AI picks the pages, sections, colours and images that fit your industry." },
  { icon: "shield-check", title: "We check", text: "Every build passes an automatic quality gate; problems are fixed before you see them." },
  { icon: "send", title: "You preview", text: "Get a live link and a plain summary of what was built and what was assumed." }
];
const promises = [
  { icon: "circle-check", text: "Only 3 questions required; everything else is optional" },
  { icon: "circle-check", text: "We list every assumption, so you know what to change" },
  { icon: "circle-check", text: "Your real prices and hours are used when you give them" }
];
const palettes = [
  { value: "auto", label: "Choose for me", hint: "Based on logo and industry", swatch: "auto" },
  { value: "deep indigo and orange, bold and modern", label: "Bold & modern", hint: "Indigo + orange", swatch: "indigo" },
  { value: "teal and sage, calm and natural", label: "Calm & natural", hint: "Teal + sage", swatch: "teal" },
  { value: "warm brown and amber, cosy and artisan", label: "Warm & artisan", hint: "Brown + amber", swatch: "warm" },
  { value: "black and gold, premium and elegant", label: "Premium", hint: "Black + gold", swatch: "black" },
  { value: "plum and rose, soft and stylish", label: "Soft & stylish", hint: "Plum + rose", swatch: "rose" }
];
const actions = [
  { value: "Book", icon: "calendar-check" }, { value: "Buy", icon: "shopping-bag" }, { value: "Call", icon: "phone" },
  { value: "Contact form", icon: "mail" }, { value: "Sign up", icon: "user-plus" }, { value: "Learn about us", icon: "info" }
];
const pages = [
  { value: "Home", checked: true }, { value: "Services", checked: true }, { value: "About", checked: true },
  { value: "Pricing" }, { value: "Gallery" }, { value: "Team" }, { value: "Contact", checked: true }, { value: "Booking" }, { value: "Blog" }
];
const scopes = [
  { value: "website", label: "Website", hint: "Most popular. Ready in minutes.", icon: "globe", checked: true },
  { value: "website-admin", label: "Website + admin app", hint: "Manage bookings or orders.", icon: "layout-dashboard" },
  { value: "full-system", label: "Full system", hint: "Website, app, database, API.", icon: "server" }
];
const timelineSteps = [
  { label: "Brief received", min: 0 },
  { label: "Planning pages and sections", min: 0.5 },
  { label: "Choosing colours and writing copy", min: 2 },
  { label: "Building pages", min: 4 },
  { label: "Quality check and fixes", min: 8 },
  { label: "Publishing preview", min: 11 }
];
const included = [
  { icon: "layout-panel-top", title: "3-6 designed pages", text: "Hero, services, reviews, FAQ, contact and more, built from proven section recipes." },
  { icon: "image", title: "Images and icons", text: "Relevant photos and a consistent icon set, with credits handled for you." },
  { icon: "calendar-check", title: "Working forms", text: "Booking or contact forms that validate and confirm, ready to connect." },
  { icon: "search", title: "SEO basics", text: "Page titles, descriptions and social previews filled in for every page." },
  { icon: "accessibility", title: "Accessible", text: "Readable contrast, keyboard friendly, screen-reader labels." },
  { icon: "file-text", title: "Plain summary", text: "What you got, what we assumed and how to change it, in everyday words." }
];
const faqs = [
  { q: "Do I need any technical knowledge?", a: "No. Answer in your own words. Developers can open the Advanced options, but you never have to." },
  { q: "What if I don't have a logo or colours?", a: "We choose a palette that suits your industry and build a simple text logo from your business name." },
  { q: "Are the prices and details real?", a: "We use any real details you paste in. Anything missing is filled with realistic samples and listed under Assumptions so you can send the real values." },
  { q: "How long does it take?", a: "A website usually takes 5-15 minutes. Full systems with an app and database take longer." },
  { q: "Can I change things afterwards?", a: "Yes. Reply with what to change, or submit a new brief. The code is clean and editable by any developer." }
];
