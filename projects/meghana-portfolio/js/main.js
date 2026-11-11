"use strict";

document.addEventListener('DOMContentLoaded', () => {
    // Theme toggle
    const themeToggle = document.getElementById('theme-toggle');
    themeToggle.addEventListener('click', () => {
        document.documentElement.classList.toggle('dark');
    });

    // Form handling
    const form = document.getElementById('contact-form');
    const msg = document.getElementById('form-msg');
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        form.reset();
        msg.classList.remove('hidden');
        setTimeout(() => msg.classList.add('hidden'), 5000);
    });

    // Icons
    lucide.createIcons();

    // Footer Year
    document.getElementById('year').textContent = new Date().getFullYear();
});
