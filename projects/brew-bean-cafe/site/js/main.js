document.addEventListener('DOMContentLoaded', () => {
  lucide.createIcons();
  
  const menuBtn = document.querySelector('[aria-controls="mobile-menu"]');
  const mobileMenu = document.getElementById('mobile-menu');
  if (menuBtn && mobileMenu) {
    menuBtn.addEventListener('click', () => {
      mobileMenu.classList.toggle('hidden');
    });
  }

  document.querySelectorAll('[data-year]').forEach(el => el.textContent = new Date().getFullYear());

  const tableBody = document.getElementById('order-table-body');
  if (tableBody) {
    dashboardOrders.forEach(order => {
      const row = document.createElement('tr');
      row.className = 'border-b border-brand-100 hover:bg-brand-50';
      row.innerHTML = `
        <td class="p-4 text-sm font-medium text-brand-900">${order.id}</td>
        <td class="p-4 text-sm text-brand-700">${order.customer}</td>
        <td class="p-4 text-sm font-semibold">$${order.total}</td>
        <td class="p-4">
          <span class="px-2 py-1 rounded-full text-xs font-medium ${order.status === 'Completed' ? 'bg-green-100 text-green-800' : order.status === 'Pending' ? 'bg-yellow-100 text-yellow-800' : 'bg-red-100 text-red-800'}">
            ${order.status}
          </span>
        </td>
      `;
      tableBody.appendChild(row);
    });
  }
});