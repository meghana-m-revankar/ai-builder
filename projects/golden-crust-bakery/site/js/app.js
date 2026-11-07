"use strict";
const App = {
    renderProducts() {
        const container = document.getElementById("product-grid");
        if (!container) return;
        products.forEach(p => {
            const div = document.createElement("div");
            div.className = "col-md-6";
            div.innerHTML = `
                <div class="card h-100">
                    <img src="${p.image}" class="card-img-top" alt="${p.name}">
                    <div class="card-body">
                        <h5>${p.name}</h5>
                        <p class="text-primary fw-bold">${p.currency} ${p.price}</p>
                    </div>
                </div>`;
            container.appendChild(div);
        });
    },
    init() {
        this.renderProducts();
        if (window.lucide) lucide.createIcons();
    }
};
document.addEventListener("DOMContentLoaded", () => App.init());
