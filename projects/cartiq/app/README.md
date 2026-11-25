# CartIq - mobile app

Expo (React Native) app for **Android only**, branded like the website (https://meghana-m-revankar.github.io/ai-builder/projects/cartiq/site/).
Screens: Home, Plans, Support, Account, plan detail and sign in.

> Items, prices and contact details marked **Sample** are placeholders - replace them in `src/data.ts` or connect your API.

## 1. Run it on your phone (10 minutes)
1. Install Node.js 20+ and the **Expo Go** app on your phone.
2. In this folder: `npm install` then `npx expo install --fix` (aligns versions with Expo SDK 52).
3. `npx expo start` and scan the QR code with Expo Go (Android) or the Camera app (iOS).

## 2. Connect your data
- Copy `.env.example` to `.env`.
- **API**: set `EXPO_PUBLIC_API_URL`; the app calls `GET /items` and `POST /support` (see `src/api.ts`). Without it the app uses the Sample data and keeps forms on the phone.
- **Login**: create a free Supabase project, enable Email and google under Authentication → Providers, add the redirect URL `cartiq://` and set `EXPO_PUBLIC_SUPABASE_URL` / `EXPO_PUBLIC_SUPABASE_ANON_KEY` (public keys only - never a service key).
- **Push notifications**: run `npx eas init`, then send notifications with the Expo push service using the token from `registerForPush()` (Android needs a Firebase project / FCM key in EAS; iOS needs an APNs key in EAS).

## 3. Test checklist
- [ ] Every tab and the detail screen open; pull to refresh works
- [ ] Form validation messages appear; submit shows a confirmation
- [ ] Sign in / guest / sign out
- [ ] Airplane mode shows the offline notice
- [ ] Small phone (iPhone SE) and large phone, dark mode, text size at 200%
- [ ] Screen reader (TalkBack / VoiceOver) reads every button

## 4. Build and publish
- Accounts: Expo (free), Google Play Console ($25 once), Apple Developer ($99/year).
- App icon: add `assets/icon.png` (1024×1024) and set `"icon": "./assets/icon.png"` in `app.json` (use the website logo).
- Test build: `npx eas build -p android --profile preview` (installable APK).
- Store builds: `npx eas build -p android` / `npx eas build -p ios`, then `npx eas submit -p android` / `-p ios`.
- Store listing needs: screenshots, short + full description, privacy policy URL (https://meghana-m-revankar.github.io/ai-builder/projects/cartiq/site/privacy.html), data-safety / privacy answers, support email.
