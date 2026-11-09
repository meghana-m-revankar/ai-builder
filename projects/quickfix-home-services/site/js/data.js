"use strict";
const heroStats = [ { value: "48h", label: "Response time" }, { value: "4.9", label: "Google rating" }, { value: "10k", label: "Jobs completed" } ];
const features = [ 
  { title: "Verified Professionals", text: "All our technicians are background-checked and trained.", image: "https://picsum.photos/seed/quickfix-tech/1200/675" }, 
  { title: "Upfront Pricing", text: "No hidden costs, transparent quotes.", icon: "dollar-sign" },
  { title: "30-Day Warranty", text: "We stand by our work.", icon: "shield-check" },
  { title: "24/7 Support", text: "Help when you need it.", icon: "clock" },
  { title: "Easy Booking", text: "Book in under 60 seconds.", icon: "smartphone" }
];
const products = [ 
  { category: "Plumbing", name: "Leak Repair", price: "499", currency: "₹", description: "Fixing leaky taps and pipes.", image: "https://picsum.photos/seed/qf-plumb/800/600", badge: "Popular" },
  { category: "Electrical", name: "Wiring Check", price: "799", currency: "₹", description: "Full home electrical safety audit.", image: "https://picsum.photos/seed/qf-elec/800/600" },
  { category: "AC", name: "AC Servicing", price: "999", currency: "₹", description: "Deep cleaning and gas check.", image: "https://picsum.photos/seed/qf-ac/800/600", badge: "Best Seller" },
  { category: "Plumbing", name: "Drain Cleaning", price: "599", currency: "₹", description: "Clearing stubborn blockages.", image: "https://picsum.photos/seed/qf-drain/800/600" },
  { category: "Electrical", name: "Fan Installation", price: "399", currency: "₹", description: "Professional ceiling fan setup.", image: "https://picsum.photos/seed/qf-fan/800/600" },
  { category: "AC", name: "AC Repair", price: "1299", currency: "₹", description: "Troubleshooting and repair.", image: "https://picsum.photos/seed/qf-acrepair/800/600" },
  { category: "Plumbing", name: "Toilet Repair", price: "699", currency: "₹", description: "Fixing flush and leakage.", image: "https://picsum.photos/seed/qf-toilet/800/600" },
  { category: "Electrical", name: "Switch Replacement", price: "299", currency: "₹", description: "Safe switch and socket change.", image: "https://picsum.photos/seed/qf-switch/800/600" }
];
const steps = [ { icon: "smartphone", title: "Book online", text: "Select your service and time." }, { icon: "user-check", title: "Pro arrives", text: "Verified expert at your door." }, { icon: "check-circle", title: "Done", text: "Quality work guaranteed." } ];
const testimonials = [ 
  { name: "Anjali R.", role: "Homeowner", avatar: "https://i.pravatar.cc/150?u=1", rating: 5, text: "Quick and professional service!" },
  { name: "Vikram S.", role: "Manager", avatar: "https://i.pravatar.cc/150?u=2", rating: 5, text: "Best AC service in Hyderabad." },
  { name: "Priya K.", role: "Architect", avatar: "https://i.pravatar.cc/150?u=3", rating: 4, text: "Reliable and transparent pricing." }
];
const faqs = [ 
  { q: "Can I book for today?", a: "Yes, we offer same-day service for most repairs." },
  { q: "Is there a warranty?", a: "Yes, all our work comes with a 30-day warranty." },
  { q: "Are your pros verified?", a: "Every technician undergoes a strict background check." },
  { q: "How do I pay?", a: "We accept cash, UPI, and cards after the job is done." },
  { q: "What if I need to cancel?", a: "You can cancel or reschedule anytime via our app." }
];
