document.addEventListener('DOMContentLoaded', () => {
  lucide.createIcons();
  
  const themeToggle = document.getElementById('theme-toggle');
  themeToggle?.addEventListener('click', () => {
    document.documentElement.classList.toggle('dark');
  });

  const contactForm = document.getElementById('contact-form');
  contactForm?.addEventListener('submit', (e) => {
    e.preventDefault();
    alert('Message sent successfully!');
    contactForm.reset();
  });
});
