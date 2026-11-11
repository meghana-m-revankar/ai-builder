document.addEventListener("DOMContentLoaded", () => {
  const menuBtn = document.querySelector('[aria-controls="mobile-menu"]');
  const mobileMenu = document.getElementById("mobile-menu");
  if(menuBtn && mobileMenu) {
    menuBtn.addEventListener("click", () => {
      mobileMenu.classList.toggle("hidden");
    });
  }
  
  const footerYear = document.getElementById("footer-year");
  if(footerYear) footerYear.textContent = new Date().getFullYear();
  
  if (typeof lucide !== 'undefined') {
    lucide.createIcons();
  }
});
