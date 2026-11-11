"use strict";
document.addEventListener("DOMContentLoaded", () => {
  const grid = document.getElementById("product-grid");
  if (grid) {
    products.forEach(p => {
      grid.innerHTML += `
        <div class="col-md-4">
          <div class="card h-100">
            <img src="${p.image}" class="card-img-top rounded-top" alt="${p.name}">
            <div class="card-body">
              <h5 class="card-title">${p.name}</h5>
              <p class="card-text fw-bold text-primary">$${p.price}</p>
            </div>
          </div>
        </div>
      `;
    });
  }
});
