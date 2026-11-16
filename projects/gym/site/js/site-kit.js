(function(){
  var $=function(s,r){return (r||document).querySelectorAll(s)};
  function run(){
    try{ window.lucide && lucide.createIcons(); }catch(e){}
    $('[data-year],.year,#year').forEach(function(e){e.textContent=new Date().getFullYear()});
    // broken image: try up to 2 spare photos from this site, then show a brand-coloured block (never a broken icon)
    var SPARES=["https://images.unsplash.com/photo-1648542036561-e1d66a5ae2b1?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MXx8cGVyc29uYWwlMjB0cmFpbmluZ3xlbnwxfHx8fDE3OTQ4MTc0NTJ8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1534258936925-c58bed479fcb?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8Mnx8cGVyc29uYWwlMjB0cmFpbmluZ3xlbnwxfHx8fDE3OTQ4MTc0NTJ8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1584466977773-e625c37cdd50?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8M3x8cGVyc29uYWwlMjB0cmFpbmluZ3xlbnwxfHx8fDE3OTQ4MTc0NTJ8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1591258370814-01609b341790?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8NHx8cGVyc29uYWwlMjB0cmFpbmluZ3xlbnwxfHx8fDE3OTQ4MTc0NTJ8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1738523686534-7055df5858d6?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8NXx8cGVyc29uYWwlMjB0cmFpbmluZ3xlbnwxfHx8fDE3OTQ4MTc0NTJ8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1519311965067-36d3e5f33d39?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8Nnx8cGVyc29uYWwlMjB0cmFpbmluZ3xlbnwxfHx8fDE3OTQ4MTc0NTJ8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1674834727149-00812f907676?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8N3x8cGVyc29uYWwlMjB0cmFpbmluZ3xlbnwxfHx8fDE3OTQ4MTc0NTJ8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1616279969856-759f316a5ac1?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8OHx8cGVyc29uYWwlMjB0cmFpbmluZ3xlbnwxfHx8fDE3OTQ4MTc0NTJ8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1571732154690-f6d1c3e5178a?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8OXx8cGVyc29uYWwlMjB0cmFpbmluZ3xlbnwxfHx8fDE3OTQ4MTc0NTJ8MA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1540206276207-3af25c08abc4?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MTB8fHBlcnNvbmFsJTIwdHJhaW5pbmd8ZW58MXx8fHwxNzk0ODE3NDUyfDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1536922246289-88c42f957773?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MTF8fHBlcnNvbmFsJTIwdHJhaW5pbmd8ZW58MXx8fHwxNzk0ODE3NDUyfDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1674834727206-4bc272bfd8da?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MTJ8fHBlcnNvbmFsJTIwdHJhaW5pbmd8ZW58MXx8fHwxNzk0ODE3NDUyfDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80"], BLOCK="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22800%22%20height%3D%22600%22%3E%3Cdefs%3E%3ClinearGradient%20id%3D%22g%22%20x1%3D%220%22%20y1%3D%220%22%20x2%3D%221%22%20y2%3D%221%22%3E%3Cstop%20offset%3D%220%22%20stop-color%3D%22%23f1f5f9%22%2F%3E%3Cstop%20offset%3D%221%22%20stop-color%3D%22%23cbd5e1%22%2F%3E%3C%2FlinearGradient%3E%3C%2Fdefs%3E%3Crect%20width%3D%22800%22%20height%3D%22600%22%20fill%3D%22url(%23g)%22%2F%3E%3C%2Fsvg%3E", si=0;
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
    // English / Arabic switch: Google Translate for the text + right-to-left layout
    if(document.querySelector('[data-lang-toggle]')){
      var ar=document.cookie.indexOf('googtrans=/en/ar')>-1;
      document.documentElement.lang=ar?'ar':'en'; document.documentElement.dir=ar?'rtl':'ltr';
      $('[data-lang-toggle]').forEach(function(b){
        b.textContent=ar?'English':'العربية';
        b.addEventListener('click',function(){
          var v=ar?'':'/en/ar', exp=ar?';expires=Thu, 01 Jan 1970 00:00:00 GMT':'';
          document.cookie='googtrans='+v+';path=/'+exp;
          document.cookie='googtrans='+v+';path=/;domain='+location.hostname+exp;
          location.reload();
        });
      });
      if(ar){
        window.googleTranslateElementInit=function(){ new google.translate.TranslateElement({pageLanguage:'en',includedLanguages:'ar',autoDisplay:false},'gt-el'); };
        var d=document.createElement('div'); d.id='gt-el'; d.style.display='none'; document.body.appendChild(d);
        var gs=document.createElement('script'); gs.src='https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit'; document.body.appendChild(gs);
        var gst=document.createElement('style'); gst.textContent='.goog-te-banner-frame,body>.skiptranslate{display:none!important}body{top:0!important}'; document.head.appendChild(gst);
      }
    }
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
