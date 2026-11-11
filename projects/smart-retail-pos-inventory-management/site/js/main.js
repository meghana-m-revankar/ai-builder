document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("year").textContent = new Date().getFullYear();
  
  const tableBody = document.getElementById("inventory-table");
  if (tableBody) {
    products.forEach(p => {
      const row = `<tr>
        <td class="p-4">${p.name}</td>
        <td class="p-4">${p.sku}</td>
        <td class="p-4">${p.stock}</td>
        <td class="p-4">$${p.price}</td>
        <td class="p-4"><span class="px-2 py-1 bg-green-100 text-green-700 rounded text-xs">${p.stock > 10 ? 'In Stock' : 'Low Stock'}</span></td>
      </tr>`;
      tableBody.innerHTML += row;
    });
  }
});
