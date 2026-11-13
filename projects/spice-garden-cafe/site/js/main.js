document.addEventListener('DOMContentLoaded', () => {
    lucide.createIcons();
    const yearSpan = document.querySelector('[data-year]');
    if(yearSpan) yearSpan.textContent = new Date().getFullYear();
    const menuToggle = document.querySelector('[aria-controls="mobile-menu"]');
    const mobileMenu = document.getElementById('mobile-menu');
    if(menuToggle && mobileMenu) {
        menuToggle.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });
    }
});
