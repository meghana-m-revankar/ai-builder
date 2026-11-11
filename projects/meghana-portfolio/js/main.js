"use strict";

document.addEventListener('DOMContentLoaded', () => {
  lucide.createIcons();

  // Theme toggle
  const themeToggle = document.getElementById('theme-toggle');
  themeToggle.addEventListener('click', () => {
    document.documentElement.classList.toggle('dark');
  });

  // Back to top
  const btt = document.getElementById('back-to-top');
  window.addEventListener('scroll', () => {
    btt.classList.toggle('hidden', window.scrollY < 400);
  });
  btt.addEventListener('click', () => window.scrollTo({ top: 0 }));

  // Form
  const form = document.getElementById('contact-form');
  const feedback = document.getElementById('form-feedback');
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    form.classList.add('hidden');
    feedback.classList.remove('hidden');
  });

  // Year
  document.getElementById('year').textContent = new Date().getFullYear();
});
