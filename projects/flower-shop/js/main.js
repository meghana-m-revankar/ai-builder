document.addEventListener('DOMContentLoaded', () => {
  lucide.createIcons();
  document.getElementById('year').textContent = new Date().getFullYear();
  
  const menuBtn = document.getElementById('mobile-menu-btn');
  if(menuBtn) {
    menuBtn.addEventListener('click', () => {
      alert('Navigation menu toggled!');
    });
  }
});
