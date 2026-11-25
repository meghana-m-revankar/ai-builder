# 19 Mobile Apps

Applies when the brief asks for "Mobile app only" or "Website + app".

## A. Choosing the platform
| Option | What is built | Best when |
|---|---|---|
| **PWA** (Progressive Web App) | The website becomes installable: `manifest.webmanifest`, offline service worker, app icons, "Add to home screen". No store needed. | Small businesses, restaurants, quick launch, low budget |
| **Cross-platform (recommended)** | One **Expo / React Native** app for Android and iOS (`app/` folder), TypeScript, expo-router | Most businesses that want store presence |
| **Android only / iOS only** | The same Expo app, configured and documented for one store | One audience only |

Native Kotlin / Swift is not generated; Expo covers both stores from one codebase.

## B. Branding (MUST match the website)
- Same name, brand colours (50-900 scale), fonts (Google Fonts via `@expo-google-fonts/*`), logo and tone as the website.
- Light/dark follows the website theme; respect the system setting when the site has no preference.
- Same honesty rule as the website: sample products, prices and contact details are marked **Sample**.

## C. Screens and navigation by industry
Bottom tabs (max 5), a stack for detail screens. Every list has loading, empty and error states.
| Industry | Tabs | Detail / flows |
|---|---|---|
| Hosting & Technology | Home (dashboard), Plans, Support, Account | Plan detail → sign up; support ticket form |
| E-commerce & Online Stores | Home, Shop, Cart, Orders, Profile | Product detail (variants, add to cart) → checkout steps |
| Real Estate & Property | Home (search), Listings, Saved, Profile | Property detail (gallery, facts, map link) → book a viewing |
| Restaurants, Cafes & Hospitality | Home, Menu, Order / Book, Profile | Dish detail → add to order; table booking |
| Corporate, Agencies & Services | Home, Services, Work, Contact, Profile | Service / case study detail → enquiry form |

## D. Features
| Feature | How |
|---|---|
| Login & auth | Supabase Auth (email + Google/Apple OAuth with PKCE via `expo-auth-session`). Tokens in `expo-secure-store`. No auth keys → "Continue as guest" mode with a Sample notice. Apple Sign-In is required on iOS when other social logins are offered. |
| User profile | Name, email, phone, avatar initials, saved items, sign out, delete account (required by both stores). |
| API integration | One `src/api.ts` client with `EXPO_PUBLIC_API_URL`; typed responses; timeouts; friendly errors; falls back to the bundled sample data. |
| Push notifications | `expo-notifications`: ask permission at a meaningful moment (after an order/booking), never on first launch; store the Expo push token on the backend. |
| Payments | Never handle card data in the app; use the payment provider's hosted checkout or SDK (Stripe / Razorpay) from the backend. |
| Offline | Cache last loaded lists with AsyncStorage; show "You're offline" banner. |

## E. Mobile UI/UX rules
- Touch targets ≥ 44×44 pt, 8 pt spacing grid, safe areas on every screen (`SafeAreaView`), thumb-reachable primary actions at the bottom.
- Text ≥ 16 pt body; support Dynamic Type (don't block font scaling); contrast ≥ 4.5:1.
- Every icon button has `accessibilityLabel`; images have `accessibilityLabel` or are marked decorative.
- Pull-to-refresh on lists; skeleton or spinner while loading; haptics only for confirmations.

## F. Testing and release (in the generated README)
1. `npm install` then `npx expo install --fix` (aligns package versions with the Expo SDK).
2. Run: `npx expo start` → scan the QR code with Expo Go on a phone.
3. Test checklist: every tab, detail screen, login/guest, form validation, offline banner, notifications permission, small phone (iPhone SE) and large phone, dark mode, font scaling 200%.
4. Build: `npx eas build -p android` / `-p ios` (free Expo account; Apple Developer ($99/yr) and Google Play ($25 once) accounts needed to publish).
5. Store listing: app icon 1024×1024, screenshots, privacy policy URL (the website's `privacy.html`), data-safety form, contact email.
6. Submit: `npx eas submit -p android` / `-p ios`.
