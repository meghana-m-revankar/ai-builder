import React from 'react';
import { ActivityIndicator, Pressable, StyleSheet, Text, View, useColorScheme, ViewStyle } from 'react-native';
import { colors, fonts, radius, space } from './theme';

export function usePalette() {
  const dark = useColorScheme() === 'dark';
  return {
    dark, text: dark ? colors.darkText : colors.text, muted: dark ? colors.darkMuted : colors.muted,
    bg: dark ? colors.darkBg : colors.bg, canvas: dark ? colors.darkCanvas : colors.canvas, line: dark ? colors.darkLine : colors.line
  };
}

export function Title({ children, size = 26 }: { children: React.ReactNode; size?: number }) {
  const p = usePalette();
  return <Text accessibilityRole="header" style={{ fontFamily: fonts.display, fontSize: size, color: p.text, fontWeight: fonts.display === 'System' ? '700' : undefined }}>{children}</Text>;
}

export function Body({ children, muted }: { children: React.ReactNode; muted?: boolean }) {
  const p = usePalette();
  return <Text style={{ fontFamily: fonts.body, fontSize: 16, lineHeight: 24, color: muted ? p.muted : p.text }}>{children}</Text>;
}

export function Button({ label, onPress, variant = 'solid', disabled }: { label: string; onPress: () => void; variant?: 'solid' | 'outline'; disabled?: boolean }) {
  const solid = variant === 'solid';
  return (
    <Pressable accessibilityRole="button" accessibilityLabel={label} disabled={disabled} onPress={onPress}
      style={({ pressed }) => [s.btn, solid ? { backgroundColor: colors.brand } : { borderWidth: 1.5, borderColor: colors.brand },
        { opacity: disabled ? 0.5 : pressed ? 0.85 : 1 }]}>
      <Text style={{ color: solid ? '#fff' : colors.brand, fontSize: 16, fontWeight: '700' }}>{label}</Text>
    </Pressable>
  );
}

export function Card({ children, style }: { children: React.ReactNode; style?: ViewStyle }) {
  const p = usePalette();
  return <View style={[s.card, { backgroundColor: p.bg, borderColor: p.line }, style]}>{children}</View>;
}

export function SampleBadge() {
  return <Text accessibilityLabel="Sample content" style={s.sample}>Sample</Text>;
}

export function Loading() { return <ActivityIndicator style={{ marginTop: space(4) }} color={colors.brand} />; }

export function Notice({ text }: { text: string }) {
  return <View style={s.notice}><Text style={{ color: colors.sample, fontSize: 14 }}>{text}</Text></View>;
}

const s = StyleSheet.create({
  btn: { minHeight: 48, borderRadius: radius.pill, alignItems: 'center', justifyContent: 'center', paddingHorizontal: space(3) },
  card: { borderWidth: 1, borderRadius: radius.md, padding: space(2), gap: space(1) },
  sample: { alignSelf: 'flex-start', backgroundColor: colors.sampleBg, color: colors.sample, fontSize: 12, fontWeight: '700', paddingHorizontal: 8, paddingVertical: 2, borderRadius: radius.pill, overflow: 'hidden' },
  notice: { backgroundColor: colors.sampleBg, padding: space(1.5), borderRadius: radius.sm }
});
