document.addEventListener('DOMContentLoaded', () => {
  const yearEl = document.querySelector('[data-year]');
  if (yearEl) yearEl.textContent = new Date().getFullYear();

  const menuBtn = document.querySelector('[aria-controls="mobile-menu"]');
  const mobileMenu = document.getElementById('mobile-menu');
  if (menuBtn && mobileMenu) {
    menuBtn.addEventListener('click', () => {
      mobileMenu.classList.toggle('hidden');
    });
  }

  const tableBody = document.getElementById('activity-table');
  if (tableBody) {
    tableBody.innerHTML = activity.map(item => `
      <tr class="border-b border-line hover:bg-brand-100">
        <td class="p-4 text-sm font-mono">${item.id}</td>
        <td class="p-4 text-sm">${item.time}</td>
        <td class="p-4 text-sm font-medium">${item.customer}</td>
        <td class="p-4 text-sm">${item.order}</td>
        <td class="p-4 text-sm font-bold">${item.total}</td>
        <td class="p-4 text-sm">
          <span class="px-2 py-1 rounded-full text-xs ${item.status === 'Completed' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'}">${item.status}</span>
        </td>
      </tr>
    `).join('');
  }
});
