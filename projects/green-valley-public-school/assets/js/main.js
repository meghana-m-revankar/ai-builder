document.addEventListener('DOMContentLoaded', () => {
    // Mobile Menu Toggle
    const mobileMenuButton = document.getElementById('mobile-menu-button');
    const mobileMenu = document.getElementById('mobile-menu');

    if (mobileMenuButton && mobileMenu) {
        mobileMenuButton.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });
    }

    // Admission Form Simulation
    const admissionForm = document.getElementById('admission-form');
    const formSuccess = document.getElementById('form-success');

    if (admissionForm) {
        admissionForm.addEventListener('submit', (e) => {
            e.preventDefault();
            admissionForm.reset();
            if (formSuccess) {
                formSuccess.classList.remove('hidden');
                setTimeout(() => {
                    formSuccess.classList.add('hidden');
                }, 6000);
            }
        });
    }

    // Contact Form Simulation
    const contactForm = document.getElementById('contact-form');
    const contactSuccess = document.getElementById('contact-success');

    if (contactForm) {
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();
            contactForm.reset();
            if (contactSuccess) {
                contactSuccess.classList.remove('hidden');
                setTimeout(() => {
                    contactSuccess.classList.add('hidden');
                }, 6000);
            }
        });
    }
});
