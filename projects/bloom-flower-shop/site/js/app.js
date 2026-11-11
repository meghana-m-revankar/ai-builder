document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('product-list');
  if (container) {
    bouquets.forEach(b => {
      container.innerHTML += `
        <div class="col-md-4">
          <div class="card">
            <img src="${b.image}" class="card-img-top" alt="${b.name}">
            <div class="card-body">
              <h5 class="card-title">${b.name}</h5>
              <p class="card-text text-primary fw-bold">AED ${b.price}</p>
              <a href="order.html?id=${b.id}" class="btn btn-outline-primary w-100">Order</a>
            </div>
          </div>
        </div>
      `;
    });
  }
});
