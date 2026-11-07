"use strict";
const App = {
  renderKPIs() {
    const container = document.getElementById("kpi-grid");
    if (!container) return;
    kpis.forEach(kpi => {
      container.innerHTML += `
        <div class="col-md-6 col-lg-3">
          <div class="kpi-card">
            <i class="bi ${kpi.icon} fs-4 text-primary"></i>
            <div class="mt-2 text-muted small">${kpi.title}</div>
            <div class="kpi-value">${kpi.value}</div>
          </div>
        </div>`;
    });
  },
  init() {
    this.renderKPIs();
  }
};
document.addEventListener("DOMContentLoaded", () => App.init());
