import { ScrollView, Alert, Linking } from 'react-native';
import { router } from 'expo-router';
import Constants from 'expo-constants';
import { useAuth, authConfigured } from '@/auth';
import { Body, Button, Card, Notice, Title, usePalette } from '@/ui';
import { space } from '@/theme';

export default function Profile() {
  const p = usePalette();
  const { session, guest, signOut } = useAuth();
  const site = String(Constants.expoConfig?.extra?.websiteUrl ?? '');
  const email = session?.user.email;
  return (
    <ScrollView style={{ backgroundColor: p.canvas }} contentContainerStyle={{ padding: space(2), gap: space(1.5) }}>
      <Title>{email ? 'Hi!' : 'Your profile'}</Title>
      {!authConfigured && <Notice text="Login is a Sample until you connect Supabase (see README)." />}
      <Card>
        <Body>{email ?? (guest ? 'Browsing as guest' : 'Not signed in')}</Body>
      </Card>
      {email || guest
        ? <Button label="Sign out" variant="outline" onPress={signOut} />
        : <Button label="Sign in" onPress={() => router.push('/login')} />}
      {email && <Button label="Delete my account" variant="outline" onPress={() => Alert.alert('Delete account', 'We will delete your account and data. Contact us to confirm.', [{ text: 'Cancel' }, { text: 'Request deletion', style: 'destructive' }])} />}
      {site ? <Button label="Privacy policy" variant="outline" onPress={() => Linking.openURL(site.replace(/\/?$/, '/') + 'privacy.html')} /> : null}
    </ScrollView>
  );
}
