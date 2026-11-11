document.addEventListener('DOMContentLoaded', () => {
  // Initialize Lucide icons if loaded
  if (typeof lucide !== 'undefined') lucide.createIcons();

  // Basic dashboard rendering
  const tableBody = document.getElementById('recent-bills-table');
  if (tableBody) {
    recentBills.forEach(bill => {
      tableBody.innerHTML += `
        <tr class="border-b">
          <td class="p-4 font-mono text-sm">${bill.id}</td>
          <td class="p-4">${bill.time}</td>
          <td class="p-4">${bill.items}</td>
          <td class="p-4 font-bold">₹${bill.total}</td>
          <td class="p-4"><span class="px-2 py-1 rounded bg-emerald-100 text-emerald-800 text-xs">${bill.status}</span></td>
        </tr>
      `;
    });
  }
});
