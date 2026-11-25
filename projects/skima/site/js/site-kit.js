(function(){
  var $=function(s,r){return (r||document).querySelectorAll(s)};
  function run(){
    try{ window.lucide && lucide.createIcons(); }catch(e){}
    $('[data-year],.year,#year').forEach(function(e){e.textContent=new Date().getFullYear()});
    // broken image: try up to 2 spare photos from this site, then show a brand-coloured block (never a broken icon)
    var SPARES=["https://images.unsplash.com/photo-1601922046210-41e129a3e64a?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MXx8Y2FuZGxlJTIwaWd8ZW58MXx8fHwxNzk1NjQwMTk1fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1640095889747-2090ee12fa7d?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8Mnx8Y2FuZGxlJTIwaWd8ZW58MXx8fHwxNzk1NjQwMTk1fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1528351655744-27cc30462816?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8M3x8Y2FuZGxlJTIwaWd8ZW58MXx8fHwxNzk1NjQwMTk1fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1559091156-b9610fb12eda?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8NHx8Y2FuZGxlJTIwaWd8ZW58MXx8fHwxNzk1NjQwMTk1fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1537948756265-406a522f1a45?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8NXx8Y2FuZGxlJTIwaWd8ZW58MXx8fHwxNzk1NjQwMTk1fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1613068431228-8cb6a1e92573?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8Nnx8Y2FuZGxlJTIwaWd8ZW58MXx8fHwxNzk1NjQwMTk1fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1603006905003-be475563bc59?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8N3x8Y2FuZGxlJTIwaWd8ZW58MXx8fHwxNzk1NjQwMTk1fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1605651202774-7d573fd3f12d?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8OHx8Y2FuZGxlJTIwaWd8ZW58MXx8fHwxNzk1NjQwMTk1fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1640085461451-e3dc47415dd1?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8OXx8Y2FuZGxlJTIwaWd8ZW58MXx8fHwxNzk1NjQwMTk1fDA&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1518528802892-ec2191995c99?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MTB8fGNhbmRsZSUyMGlnfGVufDF8fHx8MTc5NTY0MDE5NXww&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1637870793159-53329ad6b958?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MTF8fGNhbmRsZSUyMGlnfGVufDF8fHx8MTc5NTY0MDE5NXww&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80","https://images.unsplash.com/photo-1619378352777-1742dc62b564?ixid=M3wxMTMwODAzfDB8MXxzZWFyY2h8MTJ8fGNhbmRsZSUyMGlnfGVufDF8fHx8MTc5NTY0MDE5NXww&ixlib=rb-4.1.0&w=800&h=600&fit=crop&auto=format&q=80"], BLOCK="data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22800%22%20height%3D%22600%22%3E%3Cdefs%3E%3ClinearGradient%20id%3D%22g%22%20x1%3D%220%22%20y1%3D%220%22%20x2%3D%221%22%20y2%3D%221%22%3E%3Cstop%20offset%3D%220%22%20stop-color%3D%22%23f4e6f1%22%2F%3E%3Cstop%20offset%3D%221%22%20stop-color%3D%22%23dba9cf%22%2F%3E%3C%2FlinearGradient%3E%3C%2Fdefs%3E%3Crect%20width%3D%22800%22%20height%3D%22600%22%20fill%3D%22url(%23g)%22%2F%3E%3C%2Fsvg%3E", si=0;
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
    if(/[?&]labels=1/.test(location.search)){ var mp=document.querySelector('main[data-page]'), pg=mp?mp.getAttribute('data-page'):''; $('[data-section]').forEach(function(s){ var b=document.createElement('div'); b.className='notranslate'; b.textContent=(pg?pg+'-':'')+s.getAttribute('data-section'); b.style.cssText='position:absolute;top:10px;left:10px;z-index:60;background:#111827;color:#fff;font:600 12px Inter,sans-serif;padding:4px 10px;border-radius:999px;box-shadow:0 4px 12px rgba(0,0,0,.25)'; if(getComputedStyle(s).position==='static') s.style.position='relative'; s.appendChild(b); }); }
    var h=document.querySelector('header'); if(h) addEventListener('scroll',function(){ h.classList.toggle('shadow-lg',scrollY>10) },{passive:true});
    $('form').forEach(function(f){ if(f.dataset.kit) return; f.dataset.kit=1; f.addEventListener('submit',function(e){
      if(!f.checkValidity()){ e.preventDefault(); f.reportValidity(); return; }
      if(f.hasAttribute('data-netlify')){ e.preventDefault(); fetch(location.pathname,{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded'},body:new URLSearchParams(new FormData(f)).toString()}).finally(function(){ toast('Thanks! We\'ll be in touch soon.'); f.reset(); }); }
      else { e.preventDefault(); toast('Thanks! Your message was sent.'); f.reset(); }
    }); });
  }
  function toast(msg){ var t=document.createElement('div'); t.textContent=msg; t.style.cssText='position:fixed;left:50%;bottom:24px;transform:translateX(-50%);background:#111827;color:#fff;padding:12px 20px;border-radius:12px;box-shadow:0 10px 30px rgba(0,0,0,.25);z-index:9999;font:500 14px Inter,sans-serif'; document.body.appendChild(t); setTimeout(function(){t.remove()},3500); }
  window.siteToast=toast;
  // every button does something: back-to-top, and call-to-action buttons open the right page
  (function(){
    var PG=["index.html","products.html","about.html","gallery.html"];
    function pageFor(re){ for(var i=0;i<PG.length;i++){ if(re.test(PG[i])) return PG[i]; } return ''; }
    var CTA=pageFor(/contact|book|reserv|appoint|enquir/i)||'index.html';
    function top(){
      var bt=document.querySelector('[data-back-top]'); if(!bt) return;
      function f(){ var on=scrollY>400; bt.classList.toggle('opacity-0',!on); bt.classList.toggle('pointer-events-none',!on); }
      addEventListener('scroll',f,{passive:true}); f();
      bt.addEventListener('click',function(){ scrollTo({top:0,behavior:'smooth'}); });
    }
    if(document.readyState==='loading') document.addEventListener('DOMContentLoaded',top); else top();
    document.addEventListener('click',function(e){
      var b=e.target.closest&&e.target.closest('button,[role=button]'); if(!b||e.defaultPrevented) return;
      if(b.closest('form')||b.type==='submit'||b.type==='reset'||b.hasAttribute('onclick')||b.hasAttribute('aria-controls')||b.hasAttribute('aria-expanded')||b.hasAttribute('data-back-top')||b.hasAttribute('data-lang-toggle')) return;
      if(/menu|toggle|accordion|tab|close|prev|next|slide|carousel|faq|qty|plus|minus/i.test((b.className||'')+' '+(b.id||''))) return;
      var t=' '+(b.textContent||'').trim().toLowerCase()+' ';
      if(t.indexOf(' add ')>-1) return;
      var to='';
      if(/book|reserv|appoint|contact|touch|call|enquir|quote|order|join|sign|register|start|apply|subscribe/.test(t)) to=CTA;
      else if(/learn|more|explore|view|read|see|discover|service|menu|product|shop|pricing|gallery/.test(t)) to=pageFor(/service|product|menu|pricing|gallery|shop/i)||'index.html';
      if(to) location.href=to;
    });
  })();
  if(document.readyState==='loading') document.addEventListener('DOMContentLoaded',run); else run();
})();
