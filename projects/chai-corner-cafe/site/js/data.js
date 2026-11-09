"use strict";
const heroStats = [ { value: "7am", label: "Opens daily" }, { value: "4.9", label: "Google rating" }, { value: "2019", label: "Est. year" } ];
const features = [ 
  { title: "Authentic Masala Chai", text: "Slow-brewed with fresh spices for that perfect home-made taste.", image: "https://live.staticflickr.com/65535/54158919323_3b7fb26875_b.jpg" },
  { title: "South Indian Filter Coffee", text: "Rich, aromatic, and brewed to perfection.", icon: "coffee" },
  { title: "Homemade Snacks", text: "Crispy samosas and soft bun maska.", icon: "bowl-food" },
  { title: "Cozy Workspace", text: "Free Wi-Fi and quiet corners for students.", icon: "laptop" },
  { title: "Delivery Ready", text: "Order via Swiggy or Zomato.", icon: "truck" }
];
const products = [
  { id: "p1", name: "Masala Chai", category: "Chai", price: 30, currency: "₹", description: "Freshly brewed with ginger and spices.", image: "https://live.staticflickr.com/65535/54158919323_3b7fb26875_b.jpg" },
  { id: "p2", name: "Filter Coffee", category: "Coffee", price: 40, currency: "₹", description: "Strong and aromatic South Indian style.", image: "https://live.staticflickr.com/2573/3854412198_92fb32bed3_b.jpg" },
  { id: "p3", name: "Samosa (2 pcs)", category: "Snacks", price: 40, currency: "₹", description: "Crispy and golden, served with chutney.", image: "https://live.staticflickr.com/3149/3048032066_8cbec7e3ed_b.jpg" },
  { id: "p4", name: "Bun Maska", category: "Snacks", price: 50, currency: "₹", description: "Soft bun with a generous layer of butter.", image: "https://upload.wikimedia.org/wikipedia/commons/2/2c/Vada_Pav_with_Fresh_green_coriander_and_mint_Chutney_and_Garlic_chutney.jpg" },
  { id: "p5", name: "Vada Pav", category: "Snacks", price: 45, currency: "₹", description: "Mumbai's favorite street snack.", image: "https://upload.wikimedia.org/wikipedia/commons/2/2c/Vada_Pav_with_Fresh_green_coriander_and_mint_Chutney_and_Garlic_chutney.jpg" },
  { id: "p6", name: "Paneer Roll", category: "Snacks", price: 110, currency: "₹", description: "Spiced paneer wrapped in a soft paratha.", image: "https://live.staticflickr.com/6171/6205347632_e7e615ff5b_b.jpg" }
];
const steps = [ { icon: "clock", title: "Visit us", text: "Open daily from 7 am to 11 pm." }, { icon: "coffee", title: "Order your favorite", text: "Choose from our range of chai and coffee." }, { icon: "smiley", title: "Relax or work", text: "Enjoy the cozy vibe with free Wi-Fi." } ];
const testimonials = [
  { name: "Arjun Rao", role: "Student, Koramangala", avatar: "https://i.pravatar.cc/80?u=arjun", rating: 5, text: "The best chai in Bangalore. The bun maska is a must-try!" },
  { name: "Meera Nair", role: "Software Engineer", avatar: "https://i.pravatar.cc/80?u=meera", rating: 5, text: "My favorite spot to work. Great Wi-Fi and even better coffee." },
  { name: "Vikram Singh", role: "Local Resident", avatar: "https://i.pravatar.cc/80?u=vikram", rating: 4, text: "A cozy corner. The samosas are always fresh and crispy." }
];
const faqs = [ { q: "Do you have student discounts?", a: "Yes, we offer a 10% discount to students with a valid college ID." }, { q: "Is there free Wi-Fi?", a: "Yes, we provide free, high-speed Wi-Fi for all our customers." }, { q: "Do you deliver?", a: "Yes, we are available on Swiggy and Zomato for delivery." }, { q: "What are your opening hours?", a: "We are open daily from 7:00 am to 11:00 pm." }, { q: "Do you have indoor seating?", a: "Yes, we have comfortable seating for up to 30 people." } ];
