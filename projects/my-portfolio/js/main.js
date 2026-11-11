document.addEventListener('DOMContentLoaded', () => {
    lucide.createIcons();

    const toggle = document.getElementById('theme-toggle');
    const html = document.documentElement;
    const icon = document.getElementById('theme-icon');

    toggle.addEventListener('click', () => {
        const isDark = html.getAttribute('data-bs-theme') === 'dark';
        html.setAttribute('data-bs-theme', isDark ? 'light' : 'dark');
        icon.setAttribute('data-lucide', isDark ? 'moon' : 'sun');
        lucide.createIcons();
    });
});
