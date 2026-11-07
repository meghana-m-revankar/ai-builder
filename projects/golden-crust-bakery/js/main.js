document.getElementById('langToggle').addEventListener('click', () => {
    const isArabic = document.documentElement.lang === 'ar';
    document.documentElement.lang = isArabic ? 'en' : 'ar';
    document.documentElement.dir = isArabic ? 'ltr' : 'rtl';
    alert('Language switched to ' + (isArabic ? 'English' : 'Arabic'));
});
