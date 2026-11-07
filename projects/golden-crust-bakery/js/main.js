document.addEventListener("DOMContentLoaded", () => {
  const grid = document.getElementById("product-grid");
  products.forEach(p => {
    grid.innerHTML += `
      <div class="col-md-4">
        <div class="card h-100">
          <img src="${p.image}" class="card-img-top" alt="${p.name}">
          <div class="card-body">
            <h5>${p.name}</h5>
            <p class="text-primary">${p.price} AED</p>
          </div>
        </div>
      </div>
    `;
  });
});
