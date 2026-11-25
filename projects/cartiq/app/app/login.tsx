import { useState } from 'react';
import { ScrollView, TextInput, Text, Alert, Platform } from 'react-native';
import { router } from 'expo-router';
import { useAuth, authConfigured } from '@/auth';
import { Body, Button, Notice, Title, usePalette } from '@/ui';
import { radius, space } from '@/theme';

export default function Login() {
  const p = usePalette();
  const { signInWithEmail, signInWithProvider, continueAsGuest } = useAuth();
  const [email, setEmail] = useState('');
  const done = (err: string | null, msg?: string) => { if (err) Alert.alert('Sign in', err); else { if (msg) Alert.alert('Check your email', msg); router.back(); } };
  return (
    <ScrollView style={{ backgroundColor: p.canvas }} contentContainerStyle={{ padding: space(2), gap: space(1.5) }} keyboardShouldPersistTaps="handled">
      <Title>Sign in</Title>
      {!authConfigured && <Notice text="Sample: login is not connected yet. You can continue as a guest." />}
      <Text style={{ color: p.text, fontWeight: '600' }}>Email</Text>
      <TextInput value={email} onChangeText={setEmail} keyboardType="email-address" autoCapitalize="none" autoComplete="email" accessibilityLabel="Email"
        style={{ borderWidth: 1, borderColor: p.line, borderRadius: radius.sm, padding: 12, fontSize: 16, minHeight: 48, color: p.text, backgroundColor: p.bg }} />
      <Button label="Email me a sign-in link" disabled={!/\S+@\S+\.\S+/.test(email)} onPress={async () => done(await signInWithEmail(email), 'Open the link we sent to finish signing in.')} />
      <Button label="Continue with Google" variant="outline" onPress={async () => done(await signInWithProvider("google"))} />
      <Button label="Continue as guest" variant="outline" onPress={() => { continueAsGuest(); router.back(); }} />
      <Body muted>We never store your password on this phone.</Body>
    </ScrollView>
  );
}
