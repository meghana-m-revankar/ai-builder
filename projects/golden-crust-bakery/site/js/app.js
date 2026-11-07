document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('product-list');
  if (container) {
    products.forEach(p => {
      container.innerHTML += `
        <div class="col-md-4">
          <div class="card h-100">
            <img src="${p.img}" class="card-img-top" alt="${p.name}">
            <div class="card-body">
              <h5 class="card-title">${p.name}</h5>
              <p class="card-text">${p.description}</p>
              <p class="fw-bold">AED ${p.price}</p>
            </div>
          </div>
        </div>
      `;
    });
  }
});
