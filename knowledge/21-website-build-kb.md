Website Design and Development Knowledge Base
This document tells an agent how to scope, design and build a marketing website that has no backend. The only dynamic parts are an enquiry form or a chat widget, and analytics tags. It is generic: use it for any business and any industry.
MUST is a rule with no exceptions unless the user overrides it in writing. SHOULD is the default and needs a stated reason to drop. MAY is optional.
1. How to work
1.1 Order of work
1.Intake: read everything the user gave and answer the questions in 1.3.
2.Choose the site tier (section 2) and the page set (section 3).
3.Write the website scope (section 15).
4.Sitemap and URL plan, with one target search topic per page.
5.Content outline per page, then design, then build.
6.SEO setup (section 8) and tracking setup (section 9).
7.Launch checklist (section 16).
1.2 Rules for every project
No backend, no database, no admin login. If the user asks for something that needs one (user accounts, online payment, a blog editor for staff), say so and offer the closest no-backend option or mark it out of scope.
Never invent facts about the business: prices, client names, awards, statistics, testimonials, addresses. Use bracketed placeholders such as [YOUR PHONE] and list them for the user to fill.
A reference site is input for structure only. Do not copy its design, text, images or brand.
All real content MUST be in the HTML. Text that exists only inside a canvas, a 3D scene or an image cannot be read by search engines or screen readers.
Every page works with animation and 3D switched off.
State what is included, what is not, and what the user must supply.
Numbers such as page weight and load time are budgets from section 12 unless the user sets others.
1.3 Intake questions
What does the business sell, to whom, and in which cities or countries?
What should a visitor do: send an enquiry, call, WhatsApp, book, chat?
Which tier: static, animated, 3D, or 3D with animation and content?
How many pages, and is there a separate page per service, industry or location?
Which languages, and is right-to-left needed?
Is there a brand (logo, colours, fonts, photos, 3D models), or is design part of the work?
Where do enquiries go: which email, CRM or WhatsApp number?
Which chat widget, if any?
Are Google Tag Manager, Google Analytics 4, Search Console and Google Business Profile accounts already set up, and who owns them?
Is paid advertising planned (Google Ads, Meta)? It changes the tags.
Domain, hosting preference and who controls DNS.
Which privacy law applies to visitors (for the consent banner)?
2. Site tiers
Pick one tier. Each tier includes everything in the tiers above it.
Tier
What it is
Motion and 3D
Choose it when
1. Static website
Fast, content-first pages
Hover and focus states, simple fades
Budget or speed matters most; SEO-led lead generation
2. Animated website
Static site plus designed motion
Scroll reveals, page transitions, animated illustrations, micro-interactions
The brand needs to feel premium without heavy assets
3. 3D web experience
One or more real-time 3D scenes
Interactive model, scroll-driven camera, product viewer
The product or space is best understood in 3D; a showcase piece
4. 3D, animated and content website
Full content site with 3D and motion woven through
Everything in tiers 2 and 3 across a full page set
The site must rank and convert and also impress
Tier rules:
Tier 3 on its own is a showcase. If the site must rank in search, it needs the content pages of tier 4.
3D and heavy animation never sit above the main heading and the call to action on a phone unless a static poster loads first.
Quote the tier, the page count and the number of 3D scenes separately. A 3D scene is priced per scene, not per page.
3. Page sets
3.1 Standard 5-page site
Page
Purpose
Must contain
Home
Say what the business does and for whom, and lead to an enquiry
One heading with the main offer, proof, services summary, call to action
About
Build trust
Story, team or founder, credentials, locations
Services or Products
Explain the offer
One section per service with outcome, process and call to action
Work, Projects or Industries
Show evidence
Case studies, sectors served, or gallery
Contact
Convert
Enquiry form, phone, email, WhatsApp, address, map, hours
Every site also has these utility pages, not counted in the five: Privacy Policy, Terms (if needed), Thank You page after an enquiry, and a 404 page.
3.2 Larger sites
Add pages in this order of value:
1.One page per service.
2.One page per industry served.
3.One page per location served.
4.Case study pages.
5.Articles or guides (written at build time; no editor without a backend).
6.FAQ page.
3.3 Pages by industry
Start from the 5-page set and add the pages listed for the industry.
Industry
Add these pages
Main call to action
Construction and contracting
Services by trade, Projects, Certifications and Safety, Equipment, Careers
Request a quote
Real estate
Projects or Listings, Project detail, Location and amenities, Floor plans, Payment plan
Book a site visit
Logistics and transport
Services by mode, Fleet, Coverage map, Industries served, Track enquiry
Get a rate
Manufacturing and industrial
Product ranges, Product detail with specifications, Capabilities, Quality and certifications, Downloads
Request a quotation
Healthcare and clinics
Departments or treatments, Doctors, Insurance accepted, Patient information
Book an appointment
Education and training
Courses, Course detail, Faculty, Admissions, Schedule and fees
Enquire or enrol
Restaurants and hospitality
Menu, Gallery, Reservations, Events, Location
Reserve a table
Professional services (legal, accounting, consulting)
Practice areas, Team profiles, Insights, Sectors
Book a consultation
Software and technology
Product or solutions, Features, Use cases by industry, Pricing, Integrations, Resources
Book a demo
Retail and catalogue (no checkout)
Categories, Product detail, Store locator, Offers
Enquire or order on WhatsApp
Beauty, fitness and wellness
Services and prices, Packages, Trainers or stylists, Gallery
Book a session
Events and travel
Packages, Destinations, Itineraries, Gallery
Plan my trip
For an industry not listed, find the three questions a buyer in that industry asks before making contact, and give each one a page or a section.
3.4 Service, industry and location pages at scale
Each page MUST have content that is true only of that service, industry or location: the specific problem, the specific proof, the specific offer.
Do not generate pages that differ only by a swapped city or industry name. Search engines treat those as doorway pages.
Use one template with required unique fields: heading, 150 or more words of unique body text, at least one unique proof item, unique FAQs, unique title and description.
Link every such page from a hub page and from related pages.
4. Default stack (replace per project)
Role
Default
Notes
Build
Static site generator that outputs plain HTML, or hand-written HTML for 5 pages
Pages are pre-rendered at build time
Styling
Plain CSS with custom properties
No CSS framework unless asked
Scripts
Vanilla JavaScript, loaded as modules, deferred
A framework only for tiers 3 and 4 if needed
Animation
CSS transitions and animations first; one animation library for timelines and scroll
One library, not several
3D
WebGL through one 3D library; models in glTF binary with compression
Section 11
Enquiry form
Third-party form endpoint or one serverless function
Section 5
Chat
One third-party chat widget, loaded late
Section 5
Hosting
Static hosting with a CDN, HTTPS and redirects
No server to maintain
Tags
Google Tag Manager container with Google Analytics 4
Section 9
Content source
Markdown or JSON files in the repository
Edited by a developer or agent
Rules:
Prefer the browser's own features over libraries.
Self-host fonts and scripts where the licence allows. Limit fonts to two families and the weights actually used.
Record every third-party script, why it is there and what it costs in kilobytes.
5. Enquiry form and chat without a backend
5.1 Enquiry form
Choose one delivery method and write it in the scope.
Method
How it works
Use when
Form service endpoint
The form posts to a hosted form service that emails the business
Default; fastest to set up
Serverless function
One function validates the input and sends email or pushes to a CRM
The user needs CRM delivery or custom rules
CRM embedded form
The CRM's own form or its API endpoint
The user already runs a CRM
Click to WhatsApp, call or email
Links only, no form
The market prefers messaging; also the fallback
Form rules:
Ask only for what the business will use: name, phone or email, message, and at most two qualifying fields.
Label every field. Validate in the browser and again at the endpoint.
Spam protection: a hidden honeypot field plus a time check, and a challenge widget only if spam gets through.
A consent line with a link to the privacy policy. A checkbox where the law requires it.
Show a clear success state and redirect to a Thank You page, which is the conversion page for analytics.
Show a clear failure state with the phone number and email as fallback.
No API keys or secrets in the page source. Secrets live in the form service or the serverless function.
Send the page URL and the campaign parameters with the enquiry so the business knows where the lead came from.
5.2 Chat widget
One widget only. Load it after the page is interactive, or on the first scroll or click, never in the head.
Keep it clear of the main call to action and the cookie banner on phones.
Set business hours and an offline message that collects contact details.
Fire analytics events when the chat opens and when a lead is captured.
If the widget sets cookies, load it only after consent where the law requires.
6. Design rules
One clear action per page, repeated at the top, the middle and the end.
The first screen answers three questions: what is this, who is it for, what do I do next.
Design the phone layout first. Check 360, 768, 1280 and 1920 pixel widths.
One visual direction: a ground colour, one or two accents, two type families. Text contrast at least 4.5 to 1.
Real photos of the business beat stock. Mark missing images as placeholders with the required size.
Touch targets at least 44 pixels. Sticky call or WhatsApp button on phones when the business takes calls.
Header: logo, up to six links, one call to action. Footer: contact details, service links, legal links, social links.
Design the 404, Thank You, form error, loading and no-3D states.
7. Content rules
Write for the buyer's question, not for the company's organisation chart.
One page, one topic, one primary search phrase. Use the phrase in the title, the main heading, the first paragraph and the URL, in natural language.
Lead each page with the answer. Use short paragraphs, descriptive subheadings and lists for parallel items.
Proof on every page: named clients with permission, numbers the user supplied, certifications, photos, reviews.
Every page ends with the next step.
Add an FAQ section where buyers have repeated questions.
Minimum useful length: enough to answer the topic fully. Do not pad.
8. Advanced SEO
8.1 Technical foundation
Pre-rendered HTML for every page. No content that appears only after JavaScript runs.
Semantic structure: one h1 per page, ordered h2 and h3, header, nav, main, footer, lists and tables used for what they are.
URLs: lowercase, hyphenated, short, stable. Example /services/fit-out/.
One canonical URL per page. Redirect the other forms (http, www or non-www, trailing slash) with a 301.
sitemap.xml listing every indexable page, and robots.txt that points to it. Thank You and test pages are noindex.
A real 404 page that returns status 404.
Redirect map when replacing an old site: every old URL to its closest new page.
Internal links: every page reachable in three clicks; descriptive link text; breadcrumbs on pages below the top level.
Languages: one URL per language with hreflang tags and lang and dir attributes.
HTTPS only.
8.2 Meta tags on every page
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>[Primary phrase] | [Brand]</title>
<meta name="description" content="[One or two sentences, about 150 characters, with the offer and a reason to click]">
<link rel="canonical" href="https://www.example.com/services/fit-out/">
<meta name="robots" content="index, follow, max-image-preview:large">
<meta property="og:type" content="website">
<meta property="og:title" content="[Same as title or a social variant]">
<meta property="og:description" content="[Same as description or a social variant]">
<meta property="og:url" content="https://www.example.com/services/fit-out/">
<meta property="og:image" content="https://www.example.com/assets/og/fit-out.jpg">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:site_name" content="[Brand]">
<meta property="og:locale" content="en_GB">
<meta name="twitter:card" content="summary_large_image">
<link rel="icon" href="/favicon.ico" sizes="any">
<link rel="icon" href="/icon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<link rel="manifest" href="/site.webmanifest">
<meta name="theme-color" content="#ffffff">
<link rel="alternate" hreflang="en" href="https://www.example.com/services/fit-out/">
<link rel="alternate" hreflang="ar" href="https://www.example.com/ar/services/fit-out/">
<link rel="alternate" hreflang="x-default" href="https://www.example.com/services/fit-out/">
Rules:
Title: unique per page, primary phrase first, about 50 to 60 characters.
Description: unique per page, written to earn the click.
One social image per page type at 1200 by 630.
Do not use the keywords meta tag.
Keep a spreadsheet with URL, title, description, heading, primary phrase and canonical for every page.
8.3 Structured data
Add JSON-LD that matches what is visible on the page.
Page
Schema types
All pages
Organization (or LocalBusiness) and WebSite on the home page; BreadcrumbList below the top level
Contact and location pages
LocalBusiness with address, phone, hours, geo coordinates
Service pages
Service with provider and area served
Product or catalogue pages
Product with name, image, description; price only if shown
Articles
Article with author, dates, image
FAQ sections
FAQPage
Events, courses, jobs
Event, Course, JobPosting
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "[Brand]",
  "url": "https://www.example.com/",
  "logo": "https://www.example.com/assets/logo.png",
  "image": "https://www.example.com/assets/og/home.jpg",
  "telephone": "[YOUR PHONE]",
  "email": "[YOUR EMAIL]",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "[STREET]",
    "addressLocality": "[CITY]",
    "addressRegion": "[REGION]",
    "postalCode": "[POSTCODE]",
    "addressCountry": "[COUNTRY CODE]"
  },
  "openingHoursSpecification": [
    {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
      "opens": "09:00",
      "closes": "18:00"
    }
  ],
  "sameAs": ["[LINKEDIN URL]", "[INSTAGRAM URL]"]
}
</script>
Validate every template with a structured data testing tool before launch. Never mark up reviews, ratings or prices that are not on the page.
8.4 Speed and Core Web Vitals
Targets at the 75th percentile of real visits: Largest Contentful Paint within 2.5 seconds, Interaction to Next Paint within 200 milliseconds, Cumulative Layout Shift within 0.1. Confirm the current thresholds in Google's documentation at the start of each project.
Images: modern formats, correct pixel size per breakpoint with srcset, width and height attributes, lazy loading below the first screen, and high fetch priority on the main image.
Fonts: preload the main font, use font-display: swap, subset.
CSS: inline the critical part; load the rest without blocking.
JavaScript: defer everything, split by page, remove what is unused.
Third-party scripts: load late and measure each one.
Cache static files for a long time with hashed file names.
8.5 Images and media
Descriptive file names and alt text that says what the image shows. Decorative images get an empty alt.
Video: a poster image, no autoplay with sound, captions when there is speech. Host heavy video on a video platform and load the player on click.
8.6 Local and off-page setup
Create or claim the Google Business Profile. Name, address and phone MUST match the website exactly.
Embed the map on the contact page as a static image that loads the live map on click.
Verify the site in Google Search Console and Bing Webmaster Tools and submit the sitemap.
List the business in the main directories for its industry and country, with the same name, address and phone.
8.7 SEO for animated and 3D sites
The heading, body text and links exist in the HTML, outside the canvas.
Scroll-driven scenes still use real sections with real headings.
Each scene state that matters has its own URL or its own section; no single-URL site with all content behind interactions.
The 3D poster image has alt text describing the scene.
Test the page with JavaScript disabled: the content and navigation must still be there.
9. Google Tag and Google Analytics
9.1 Setup
Use one Google Tag Manager container per site. Put Google Analytics 4, advertising tags and other pixels inside it. Do not also hard-code the analytics snippet, or page views are counted twice.
The accounts belong to the client. Create them in the client's Google account or get admin access; never in the agency's account only.
One GA4 property per site, with a web data stream and enhanced measurement on.
Link GA4 to Search Console, and to Google Ads if ads are planned.
Container snippet, with consent defaults set first:
<!-- In <head>, as high as possible -->
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){ dataLayer.push(arguments); }
  gtag('consent', 'default', {
    ad_storage: 'denied',
    ad_user_data: 'denied',
    ad_personalization: 'denied',
    analytics_storage: 'denied',
    wait_for_update: 500
  });
</script>
<script>
  (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});
  var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';
  j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','dataLayer','GTM-XXXXXXX');
</script>
<!-- Immediately after <body> -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-XXXXXXX"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
When the visitor accepts in the consent banner:
<script>
  gtag('consent', 'update', {
    ad_storage: 'granted',
    ad_user_data: 'granted',
    ad_personalization: 'granted',
    analytics_storage: 'granted'
  });
</script>
Where no consent law applies, set the defaults to granted and record that decision in the scope.
9.2 Events to track
Event name
Fires when
Mark as key event
generate_lead
Enquiry form is sent successfully (Thank You page or success callback)
Yes
form_start
Visitor first types in the enquiry form
No
form_error
Form submission fails
No
click_call
Tap on a phone link
Yes
click_whatsapp
Tap on a WhatsApp link
Yes
click_email
Tap on an email link
Optional
chat_open
Chat widget is opened
No
chat_lead
Chat captures contact details
Yes
file_download
Brochure or document download
Optional
cta_click
Click on a main call-to-action button
No
scene_interact
First interaction with a 3D scene (tiers 3 and 4)
No
video_start
A video starts
No
Push events to the data layer from the page and map them to GA4 event tags in the container:
<script>
  function trackLead(formName) {
    window.dataLayer = window.dataLayer || [];
    window.dataLayer.push({
      event: 'generate_lead',
      form_name: formName,
      page_path: location.pathname
    });
  }
  document.addEventListener('click', function (e) {
    var a = e.target.closest('a');
    if (!a) return;
    var href = a.getAttribute('href') || '';
    var name = href.indexOf('tel:') === 0 ? 'click_call'
             : href.indexOf('mailto:') === 0 ? 'click_email'
             : href.indexOf('wa.me') > -1 || href.indexOf('api.whatsapp.com') > -1 ? 'click_whatsapp'
             : null;
    if (name) {
      window.dataLayer = window.dataLayer || [];
      window.dataLayer.push({ event: name, link_url: href, page_path: location.pathname });
    }
  });
</script>
9.3 Rules
Never send personal data (name, email, phone, message text) to analytics.
Keep campaign parameters (utm_source, utm_medium, utm_campaign) on links from ads, email and social posts, and pass them into the enquiry.
Exclude internal traffic and set the reporting time zone and currency.
Test in the tag manager's preview mode and in GA4's debug view before launch. Send one test enquiry per form and confirm it arrives and is counted once.
Deliver a tracking plan: a table of every event, its trigger, its parameters and whether it is a key event.
10. Animation rules (tiers 2 and 4)
Every animation has a job: guide attention, show a change of state, explain a process, or express the brand. Remove the ones with no job.
Animate transform and opacity only. Do not animate layout properties.
Durations: 150 to 300 milliseconds for interface feedback, up to 800 for entrances. Ease out for entrances, ease in for exits.
Scroll reveals trigger once and never hide content from users who scroll fast.
Do not take over the scroll wheel. Scroll-linked animation follows native scrolling.
No animation delays the main heading or the call to action.
Respect reduced motion:
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}
Pause animation that is off screen or in a hidden tab.
Animated illustrations: vector animation files or CSS, not large GIFs.
Page transitions MUST NOT break the back button, deep links or analytics page views.
11. 3D rules (tiers 3 and 4)
11.1 Assets
Models in glTF binary with geometry and texture compression.
Budgets per scene, to adjust per project: up to 100,000 triangles, up to 3 megabytes compressed, textures no larger than 2048 pixels and smaller on phones.
Bake lighting where possible. Limit real-time lights and shadows.
Confirm the licence of every model, texture and environment map.
11.2 Loading
Show a static poster image of the scene immediately. It is the largest paint and it is what phones on slow networks keep.
Load the 3D library and the model only when the scene is near the viewport, or after the page is interactive.
Show progress while loading and never block the rest of the page.
Detect support and capability. Without WebGL, on low memory, on data saver, or with reduced motion set, keep the poster or a short video.
11.3 Behaviour
Target 60 frames per second on a mid-range phone; cap the pixel ratio at 2; stop rendering when the scene is off screen or the tab is hidden.
Interaction is optional. The page makes sense without touching the scene.
Dragging the scene MUST NOT trap page scrolling on touch screens.
Provide keyboard-reachable controls or a text alternative for what the scene shows.
Release geometry, textures and the renderer when leaving the page.
11.4 What to write in the scope
Number of scenes, what each shows, who supplies the models, interaction per scene, the fallback, and the device and browser list it is tested on.
12. Performance budgets
Defaults for the first load of a page on a phone. Adjust per project and write the agreed numbers in the scope.
Tier
Page weight before lazy content
JavaScript
Notes
1. Static
1 MB
100 KB
Should pass Core Web Vitals comfortably
2. Animated
1.5 MB
200 KB
Animation library loaded once, deferred
3. 3D experience
2 MB before the scene
300 KB before the 3D library
Scene loads lazily; up to 5 MB more
4. 3D, animated and content
2 MB before the scene
300 KB before the 3D library
Content pages without a scene follow tier 2
Measure with a lab tool on a throttled phone profile during the build, and with real-user data after launch.
13. Accessibility
Meet WCAG 2.2 level AA.
Everything works by keyboard, with a visible focus state and a skip link.
Form fields have labels, errors are announced, and required fields are marked in text.
Colour is never the only signal.
Media has captions or transcripts. Nothing flashes more than three times a second.
The chat widget and the cookie banner are keyboard-accessible and do not trap focus.
Test with a screen reader on the home page, one inner page and the form.
14. Security and privacy for a static site
HTTPS with automatic certificate renewal and HSTS.
Security headers at the host: Content-Security-Policy, X-Content-Type- Options, Referrer-Policy, Permissions-Policy, and frame protection.
Subresource integrity on third-party scripts that support it.
No secrets, tokens or private email routing rules in the repository or the page source.
A privacy policy that names every third party receiving data: form service, chat, analytics, advertising, maps, fonts, video.
A consent banner where the law requires it, wired to the consent calls in section 9. Tags that need consent do not fire before it.
Enquiry data is kept by the form service or CRM, not in the site.
15. Website scope template
1.Overview: the business, the audience, the goal of the site.
2.Tier and page count: the tier from section 2, the page list, the number of 3D scenes and animated sections.
3.Sitemap: page, URL, purpose, primary search phrase.
4.Features: enquiry method, chat widget, languages, maps, downloads.
5.Design: brand inputs, number of design rounds, devices covered.
6.Content: who writes it, who supplies photos, video and 3D models.
7.SEO: what is set up at launch (sections 8.1 to 8.6) and what ongoing SEO is not included.
8.Tracking: container, GA4 property, event table, consent banner.
9.Technology and hosting: stack table, hosting, domain and DNS owner.
10.Budgets: performance budgets, browsers and devices tested.
11.Deliverables: source repository, built site, design files, tracking plan, SEO spreadsheet, handover guide, account ownership list.
12.Out of scope: backend, logins, payments, content management system, ongoing content, paid advertising management, unless stated.
13.Assumptions and open questions.
How pages are updated after launch MUST be stated: by a developer or agent editing files, or through an added headless content service (extra scope).
16. Launch checklist
Every page has a unique title, description, canonical and one h1.
Sitemap and robots file are live; test and Thank You pages are noindex.
Old URLs redirect; no broken links; the 404 page returns 404.
Structured data validates.
Each form: a test enquiry arrives, the success and failure states work, spam protection works.
Chat opens, the offline message works, events fire.
Tag manager container published; GA4 receives page views once; key events marked; consent banner blocks and releases tags correctly.
Search Console and Bing verified; sitemap submitted; GA4 linked.
Performance budgets met on a phone profile.
Works with JavaScript off (content and navigation), with reduced motion, and without WebGL.
Keyboard and screen reader pass.
HTTPS, redirects to one host name, security headers present.
Favicon, social image and web manifest present.
Privacy policy lists every third party in use.
Accounts handed over: domain, hosting, tag manager, analytics, Search Console, Business Profile, form service, chat.
17. Open questions to raise every time
Who supplies text, photos, video and 3D models, and by when?
Where do enquiries go, and who answers them?
Which consent law applies?
Who owns the Google accounts and the domain?
How will pages be updated after launch?
Is paid advertising planned at launch?
Which languages and which markets?
Which devices and browsers must be supported?
18. Definition of done
Every page in the sitemap is built, linked and indexable, or deliberately noindex.
No placeholder text remains except items the user was told to supply.
The site meets the agreed budgets and passes the launch checklist.
A test enquiry was received by the client and counted in analytics.
The client has owner access to every account.
The handover guide explains how to change text, add a page, and read the enquiry and traffic reports.
