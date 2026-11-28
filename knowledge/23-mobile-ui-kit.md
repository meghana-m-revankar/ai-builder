# 23 Mobile UI Kit (Expo)

Extends 19 Mobile Apps. 19 says WHAT screens and features to build; this file says WHICH components and tokens to use so the app does not look hand-made or random.

## A. Allowed kit (MUST: import, do not hand-build)
| Need | Use |
|---|---|
| Styling | NativeWind (Tailwind classes in React Native), same token names as the website |
| Components | React Native Reusables (shadcn-style). Alternative: React Native Paper |
| Navigation | expo-router: bottom tabs (max 5) + stack for detail screens |
| Icons | lucide-react-native (same pack as the website) |
| Animation | react-native-reanimated, optional moti. Never web-only libraries |
| Fonts | @expo-google-fonts/* (same 2 families as the website) |
| Images | expo-image with a blurhash or solid placeholder |
| Charts | react-native-gifted-charts or Victory Native (not Chart.js, not ECharts) |

Do not hand-build buttons, inputs, cards, sheets or modals. Import them from the kit and theme them once.

## B. Tokens file (MUST: one `src/theme.ts`, never override inline)
- Colours: copy the website's 50-900 brand scale; add `background`, `surface`, `text`, `textMuted`, `border`, `danger`, `success` for light AND dark.
- Spacing: 4, 8, 12, 16, 24, 32. Screen padding 16.
- Radius: 12 for cards, 999 for pills and avatars.
- Type: title 24/700, section 18/600, body 16/400, caption 13/400 muted.
- Shadow: one soft card shadow, used sparingly. Prefer a 1px border.

## C. Screen quality bar
- One primary action per screen, at the bottom, inside thumb reach.
- Every list: skeleton while loading, empty state (icon + one line + action), error state with Retry.
- Use FlatList for long lists. Pull-to-refresh on feeds.
- Every Pressable has a visible pressed state and `accessibilityLabel`.
- Sticky bottom bar for the key action on detail screens (Add to cart, Book, Enquire).
- At least one polished moment per app: onboarding slides, a hero card with a gradient, or a subtle list-item entrance animation.

## D. Reusable screen set (build these first, then adapt per industry from 19 C)
Onboarding (3 slides) > Home > List with search/filter > Detail > Form with validation > Profile/settings.

## E. Never
Default blue system buttons, text under 14, edge-to-edge text without padding, more than 2 fonts, more than one accent colour, emojis as icons, copying another app's layout or assets.
