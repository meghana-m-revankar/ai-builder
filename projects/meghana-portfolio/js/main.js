document.addEventListener('DOMContentLoaded', () => {
    lucide.createIcons();
    
    // Theme Toggle
    const toggle = document.getElementById('theme-toggle');
    toggle.addEventListener('click', () => {
        document.body.classList.toggle('dark-mode');
    });

    // Form
    const form = document.getElementById('contact-form');
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        alert('Thank you for your message!');
        form.reset();
    });
});
