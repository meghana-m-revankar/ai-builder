"use strict";

const App = {
  init() {
    const classGrid = document.getElementById("class-grid");
    classes.forEach(c => {
      classGrid.innerHTML += `
        <div class="col-md-4">
          <div class="card p-4 shadow-sm h-100">
            <i class="bi ${c.icon} fs-2 text-brand-700"></i>
            <h3 class="mt-3">${c.name}</h3>
            <p class="text-muted">Intensity: ${c.intensity} | ${c.duration}</p>
          </div>
        </div>`;
      const select = document.getElementById("class-select");
      if(select) select.innerHTML += `<option value="${c.name}">${c.name}</option>`;
    });

    const membershipGrid = document.getElementById("membership-grid");
    memberships.forEach(m => {
      membershipGrid.innerHTML += `
        <div class="col-md-4">
          <div class="card p-4 shadow ${m.highlighted ? 'border-primary border-3' : ''}">
            <h3>${m.name}</h3>
            <h2 class="display-6 fw-bold">AED ${m.price}</h2>
            <p>${m.desc}</p>
            <button class="btn btn-outline-primary">Choose Plan</button>
          </div>
        </div>`;
    });

    document.getElementById("booking-form").addEventListener("submit", (e) => {
      e.preventDefault();
      alert("Trial booked successfully!");
      e.target.reset();
    });
  }
};

document.addEventListener("DOMContentLoaded", App.init);
