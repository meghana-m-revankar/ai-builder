"use strict";

const App = {
  init() {
    this.renderContacts();
    lucide.createIcons();
    document.getElementById("message-form").addEventListener("submit", this.sendMessage.bind(this));
  },

  renderContacts() {
    const list = document.getElementById("contact-list");
    contacts.forEach(c => {
      const item = document.createElement("div");
      item.className = "flex items-center gap-3 p-4 hover:bg-gray-100 cursor-pointer border-b";
      item.innerHTML = `
        <img src="${c.avatar}" class="w-12 h-12 rounded-full">
        <div class="flex-1">
          <div class="flex justify-between font-bold text-sm"><span>${c.name}</span><span class="text-xs text-gray-400">${c.time}</span></div>
          <p class="text-xs text-gray-500">${c.lastMsg}</p>
        </div>
      `;
      item.onclick = () => this.loadChat(c);
      list.appendChild(item);
    });
  },

  loadChat(contact) {
    document.getElementById("chat-name").textContent = contact.name;
    document.getElementById("chat-status").textContent = contact.status;
    document.getElementById("chat-avatar").src = contact.avatar;
    const container = document.getElementById("message-container");
    container.innerHTML = "";
    (messages[contact.id] || []).forEach(m => {
      const div = document.createElement("div");
      div.className = `message-bubble p-3 rounded-lg text-sm ${m.sender === 'own' ? 'own-message' : 'other-message'}`;
      div.textContent = m.text;
      container.appendChild(div);
    });
    document.getElementById("chat-window").classList.remove("hidden");
    document.getElementById("sidebar").classList.add("hidden", "md:flex");
  },

  sendMessage(e) {
    e.preventDefault();
    const input = document.getElementById("message-input");
    if (!input.value.trim()) return;
    const container = document.getElementById("message-container");
    const div = document.createElement("div");
    div.className = "message-bubble p-3 rounded-lg text-sm own-message";
    div.textContent = input.value;
    container.appendChild(div);
    input.value = "";
    container.scrollTop = container.scrollHeight;
  }
};

document.addEventListener("DOMContentLoaded", () => App.init());
