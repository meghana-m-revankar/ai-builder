document.addEventListener('DOMContentLoaded', () => {
  const toggle = document.querySelector('#theme-toggle');
  toggle.addEventListener('click', () => {
    document.documentElement.classList.toggle('dark');
  });
  lucide.createIcons();
});
