(function(){
  var $=function(s,r){return (r||document).querySelectorAll(s)};
  function run(){
    try{ window.lucide && lucide.createIcons(); }catch(e){}
    $('[data-year],.year,#year').forEach(function(e){e.textContent=new Date().getFullYear()});
    // broken images -> keyword fallback photo
    $('img').forEach(function(img){ img.addEventListener('error',function(){ if(img.dataset.fb) return; img.dataset.fb=1;
      var k=(img.alt||'business').toLowerCase().replace(/[^a-z ]/g,'').split(' ').filter(Boolean).slice(0,3).join(',');
      img.src='https://loremflickr.com/'+(img.width||800)+'/'+(img.height||600)+'/'+k; }); });
    // mobile menu: any button with aria-controls / data-menu-toggle / #menu-btn
    $('[data-menu-toggle],[aria-controls],#menu-btn,#mobile-menu-button,.menu-toggle').forEach(function(b){
      if(b.dataset.kit) return; b.dataset.kit=1;
      var id=b.getAttribute('aria-controls')||b.dataset.menuToggle||'mobile-menu';
      var m=document.getElementById(id)||document.querySelector('#mobile-menu,.mobile-menu,[data-mobile-menu]'); if(!m) return;
      b.addEventListener('click',function(e){ if(e.defaultPrevented) return; e.preventDefault(); m.classList.toggle('hidden'); b.setAttribute('aria-expanded',!m.classList.contains('hidden')); });
    });
    // smooth scroll + close menu
    $('a[href^="#"]').forEach(function(a){ a.addEventListener('click',function(e){ var t=document.querySelector(a.getAttribute('href').length>1?a.getAttribute('href'):'body'); if(!t) return; e.preventDefault(); t.scrollIntoView({behavior:'smooth'}); var m=document.querySelector('#mobile-menu'); if(m&&innerWidth<768) m.classList.add('hidden'); }); });
    // active nav link
    var here=location.pathname.split('/').pop()||'index.html';
    $('nav a[href]').forEach(function(a){ if(a.getAttribute('href')===here){ a.classList.add('font-semibold'); a.setAttribute('aria-current','page'); } });
    // reveal on scroll
    // responsive safety net: no sideways scroll, images/tables/media never overflow on phones
    $('table').forEach(function(t){ if(t.parentElement && !/overflow-x/.test(t.parentElement.className)){ var w=document.createElement('div'); w.style.overflowX='auto'; t.parentNode.insertBefore(w,t); w.appendChild(t);} });
    var st=document.createElement('style'); st.textContent='html,body{overflow-x:hidden}img,video,svg,iframe{max-width:100%}img:not([class*="h-"]){height:auto}@media(max-width:640px){[class*="w-["]{width:100%!important}h1{font-size:clamp(2rem,9vw,3rem)!important;line-height:1.1!important}section{padding-left:1rem;padding-right:1rem}}.kit-r{opacity:0;transform:translateY(24px);transition:opacity .7s ease,transform .7s ease}.kit-r.in{opacity:1;transform:none}@media(prefers-reduced-motion:reduce){.kit-r{opacity:1;transform:none}}'; document.head.appendChild(st);
    if('IntersectionObserver' in window){ var io=new IntersectionObserver(function(es){es.forEach(function(e){ if(e.isIntersecting){e.target.classList.add('in'); io.unobserve(e.target);} })},{threshold:.12});
      $('main section, body > section, .card, [class*="rounded-2xl"]').forEach(function(el,i){ if(el.getBoundingClientRect().top>innerHeight){ el.classList.add('kit-r'); el.style.transitionDelay=(i%4*80)+'ms'; io.observe(el);} }); }
    // sticky header shadow
    var h=document.querySelector('header'); if(h) addEventListener('scroll',function(){ h.classList.toggle('shadow-lg',scrollY>10) },{passive:true});
    // forms: validate + toast (Netlify Forms still receives the POST)
    $('form').forEach(function(f){ if(f.dataset.kit) return; f.dataset.kit=1; f.addEventListener('submit',function(e){
      if(!f.checkValidity()){ e.preventDefault(); f.reportValidity(); return; }
      if(f.hasAttribute('data-netlify')){ e.preventDefault(); fetch(location.pathname,{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded'},body:new URLSearchParams(new FormData(f)).toString()}).finally(function(){ toast('Thanks! We\'ll be in touch soon.'); f.reset(); }); }
      else { e.preventDefault(); toast('Thanks! Your message was sent.'); f.reset(); }
    }); });
  }
  function toast(msg){ var t=document.createElement('div'); t.textContent=msg; t.style.cssText='position:fixed;left:50%;bottom:24px;transform:translateX(-50%);background:#111827;color:#fff;padding:12px 20px;border-radius:12px;box-shadow:0 10px 30px rgba(0,0,0,.25);z-index:9999;font:500 14px Inter,sans-serif'; document.body.appendChild(t); setTimeout(function(){t.remove()},3500); }
  window.siteToast=toast;
  if(document.readyState==='loading') document.addEventListener('DOMContentLoaded',run); else run();
})();
