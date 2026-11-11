document.addEventListener('DOMContentLoaded', () => {
  lucide.createIcons();

  const themeToggle = document.getElementById('theme-toggle');
  themeToggle.addEventListener('click', () => {
    document.documentElement.classList.toggle('dark');
  });

  const form = document.getElementById('contact-form');
  const msg = document.getElementById('form-msg');
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    form.classList.add('hidden');
    msg.classList.remove('hidden');
  });

  document.getElementById('year').textContent = new Date().getFullYear();
});
