(function(){
  var $=function(s,r){return (r||document).querySelectorAll(s)};
  function run(){
    try{ window.lucide && lucide.createIcons(); }catch(e){}
    $('[data-year],.year,#year').forEach(function(e){e.textContent=new Date().getFullYear()});
    // broken image: 1st try a picsum photo, 2nd show a soft brand-coloured block instead of a broken icon
    function fixImg(img){ var n=+(img.dataset.fb||0); if(n>=2) return; img.dataset.fb=n+1;
      if(n===0){ var k=(img.alt||'photo').toLowerCase().replace(/[^a-z ]/g,'').split(' ').filter(Boolean).slice(0,3).join('-')||'photo';
        img.src='https://picsum.photos/seed/'+k+'-fb/'+(img.width>50?img.width:800)+'/'+(img.height>50?img.height:600); }
      else { img.src='data:image/svg+xml,'+encodeURIComponent('<svg xmlns="http://www.w3.org/2000/svg" width="800" height="600"><defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1"><stop offset="0" stop-color="#e2e8f0"/><stop offset="1" stop-color="#cbd5e1"/></linearGradient></defs><rect width="800" height="600" fill="url(#g)"/></svg>'); } }
    $('img').forEach(function(img){ img.addEventListener('error',function(){ fixImg(img); });
      if(img.complete && img.naturalWidth===0 && img.getAttribute('src')) fixImg(img); });
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
