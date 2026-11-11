document.getElementById('theme-toggle').addEventListener('click', () => {
    document.body.classList.toggle('dark-mode');
});

document.getElementById('contact-form').addEventListener('submit', (e) => {
    e.preventDefault();
    document.getElementById('msg-status').innerText = "Thank you, your message was sent!";
});