(function(){
  var $=function(s,r){return (r||document).querySelectorAll(s)};
  function run(){
    try{ window.lucide && lucide.createIcons(); }catch(e){}
    $('[data-year],.year,#year').forEach(function(e){e.textContent=new Date().getFullYear()});
    // broken image: try up to 2 spare photos from this site, then show a brand-coloured block (never a broken icon)
    var SPARES=["https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MXx8ZmluZSUyMGRpbmluZ3xlbnwxfHx8fDE3OTQ2NDU5Nzh8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1663530761401-15eefb544889?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8Mnx8ZmluZSUyMGRpbmluZ3xlbnwxfHx8fDE3OTQ2NDU5Nzh8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8M3x8ZmluZSUyMGRpbmluZ3xlbnwxfHx8fDE3OTQ2NDU5Nzh8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1551632436-cbf8dd35adfa?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8NHx8ZmluZSUyMGRpbmluZ3xlbnwxfHx8fDE3OTQ2NDU5Nzh8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1560053608-13721e0d69e8?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8NXx8ZmluZSUyMGRpbmluZ3xlbnwxfHx8fDE3OTQ2NDU5Nzh8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1611520175743-30ff00129621?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8Nnx8ZmluZSUyMGRpbmluZ3xlbnwxfHx8fDE3OTQ2NDU5Nzh8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1643879397174-4f10ac503566?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8N3x8ZmluZSUyMGRpbmluZ3xlbnwxfHx8fDE3OTQ2NDU5Nzh8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1616671285410-2a676a9a433d?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8OHx8ZmluZSUyMGRpbmluZ3xlbnwxfHx8fDE3OTQ2NDU5Nzh8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1676471926534-d5c9771909fa?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8OXx8ZmluZSUyMGRpbmluZ3xlbnwxfHx8fDE3OTQ2NDU5Nzh8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1694021408920-922ff450c525?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MTB8fGZpbmUlMjBkaW5pbmd8ZW58MXx8fHwxNzk0NjQ1OTc4fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1559339352-11d035aa65de?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MTF8fGZpbmUlMjBkaW5pbmd8ZW58MXx8fHwxNzk0NjQ1OTc4fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1593270797842-4b8e6cecd2b2?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MTJ8fGZpbmUlMjBkaW5pbmd8ZW58MXx8fHwxNzk0NjQ1OTc4fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80"], BLOCK="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22800%22%20height%3D%22600%22%3E%3Cdefs%3E%3ClinearGradient%20id%3D%22g%22%20x1%3D%220%22%20y1%3D%220%22%20x2%3D%221%22%20y2%3D%221%22%3E%3Cstop%20offset%3D%220%22%20stop-color%3D%22%23fef3c7%22%2F%3E%3Cstop%20offset%3D%221%22%20stop-color%3D%22%23fcd34d%22%2F%3E%3C%2FlinearGradient%3E%3C%2Fdefs%3E%3Crect%20width%3D%22800%22%20height%3D%22600%22%20fill%3D%22url(%23g)%22%2F%3E%3C%2Fsvg%3E", si=0;
    function fixImg(img){ var n=+(img.dataset.fb||0); if(n>=3) return; img.dataset.fb=n+1;
      img.src=(n<2 && SPARES.length) ? SPARES[(si++)%SPARES.length] : BLOCK; }
    $('img').forEach(function(img){ if(img.complete && img.naturalWidth===0 && img.getAttribute('src')) fixImg(img); });
    // one listener for the whole page (capture phase) also covers images that page scripts add later
    if(!window.__kitImg){ window.__kitImg=1; document.addEventListener('error',function(e){ if(e.target && e.target.tagName==='IMG') fixImg(e.target); },true); }
    // images with no src at all
    $('img:not([src]), img[src=""]').forEach(fixImg);
    $('[data-menu-toggle],[aria-controls],#menu-btn,#mobile-menu-button,.menu-toggle').forEach(function(b){
      if(b.dataset.kit) return; b.dataset.kit=1;
      var id=b.getAttribute('aria-controls')||b.dataset.menuToggle||'mobile-menu';
      var m=document.getElementById(id)||document.querySelector('#mobile-menu,.mobile-menu,[data-mobile-menu]'); if(!m) return;
      b.addEventListener('click',function(e){ if(e.defaultPrevented) return; e.preventDefault(); m.classList.toggle('hidden'); b.setAttribute('aria-expanded',!m.classList.contains('hidden')); });
    });
    $('a[href^="#"]').forEach(function(a){ a.addEventListener('click',function(e){ var t=document.querySelector(a.getAttribute('href').length>1?a.getAttribute('href'):'body'); if(!t) return; e.preventDefault(); t.scrollIntoView({behavior:'smooth'}); var m=document.querySelector('#mobile-menu'); if(m&&innerWidth<768) m.classList.add('hidden'); }); });
    var here=location.pathname.split('/').pop()||'index.html';
    $('nav a[href], #mobile-menu a[href]').forEach(function(a){ if(a.getAttribute('href')===here){ a.classList.add('font-semibold','text-brand-600'); a.setAttribute('aria-current','page'); } });
    $('table').forEach(function(t){ if(t.parentElement && !/overflow-x/.test(t.parentElement.className)){ var w=document.createElement('div'); w.style.overflowX='auto'; t.parentNode.insertBefore(w,t); w.appendChild(t);} });
    var st=document.createElement('style'); st.textContent='html,body{overflow-x:hidden}img,video,svg,iframe{max-width:100%}img:not([class*="h-"]){height:auto}@media(max-width:640px){[class*="w-["]{width:100%!important}h1{font-size:clamp(2rem,9vw,3rem)!important;line-height:1.1!important}}.kit-r{opacity:0;transform:translateY(24px);transition:opacity .7s ease,transform .7s ease}.kit-r.in{opacity:1;transform:none}@media(prefers-reduced-motion:reduce){.kit-r{opacity:1;transform:none}}'; document.head.appendChild(st);
    if('IntersectionObserver' in window){ var io=new IntersectionObserver(function(es){es.forEach(function(e){ if(e.isIntersecting){e.target.classList.add('in'); io.unobserve(e.target);} })},{threshold:.12});
      $('main section, body > section, .card, [class*="rounded-2xl"]').forEach(function(el,i){ if(el.getBoundingClientRect().top>innerHeight){ el.classList.add('kit-r'); el.style.transitionDelay=(i%4*80)+'ms'; io.observe(el);} }); }
    var h=document.querySelector('header'); if(h) addEventListener('scroll',function(){ h.classList.toggle('shadow-lg',scrollY>10) },{passive:true});
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
