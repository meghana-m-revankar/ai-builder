"use strict";

document.addEventListener('DOMContentLoaded', () => {
    // Mobile menu
    const toggle = document.querySelector('[aria-controls="mobile-menu"]');
    const menu = document.getElementById('mobile-menu');
    if (toggle && menu) {
        toggle.addEventListener('click', () => {
            menu.classList.toggle('hidden');
        });
    }

    // Dashboard table logic (if on dashboard page)
    const tableBody = document.getElementById('dashboard-table-body');
    if (tableBody) {
        orders.forEach(o => {
            const row = document.createElement('tr');
            row.innerHTML = `<td class="px-6 py-4">${o.id}</td><td class="px-6 py-4">${o.customer}</td><td class="px-6 py-4">₹${o.total}</td><td><span class="px-2 py-1 bg-gray-800 rounded text-xs">${o.status}</span></td>`;
            tableBody.appendChild(row);
        });
    }

    // Update footer year
    document.getElementById('year').textContent = new Date().getFullYear();
});
