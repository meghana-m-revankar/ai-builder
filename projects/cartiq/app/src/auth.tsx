import 'react-native-url-polyfill/auto';
import React, { createContext, useContext, useEffect, useState } from 'react';
import * as SecureStore from 'expo-secure-store';
import * as WebBrowser from 'expo-web-browser';
import { makeRedirectUri } from 'expo-auth-session';
import { createClient, Session } from '@supabase/supabase-js';

WebBrowser.maybeCompleteAuthSession();
const url = process.env.EXPO_PUBLIC_SUPABASE_URL ?? '';
const anonKey = process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY ?? '';
/** True when Supabase keys are set; otherwise the app runs in guest (Sample) mode. */
export const authConfigured = Boolean(url && anonKey);

const storage = {
  getItem: (k: string) => SecureStore.getItemAsync(k),
  setItem: (k: string, v: string) => SecureStore.setItemAsync(k, v),
  removeItem: (k: string) => SecureStore.deleteItemAsync(k)
};
export const supabase = authConfigured
  ? createClient(url, anonKey, { auth: { storage, autoRefreshToken: true, persistSession: true, detectSessionInUrl: false } })
  : null;

type Auth = { session: Session | null; guest: boolean; continueAsGuest: () => void; signOut: () => Promise<void>;
  signInWithEmail: (email: string) => Promise<string | null>; signInWithProvider: (p: 'google' | 'apple') => Promise<string | null> };
const Ctx = createContext<Auth | null>(null);

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [session, setSession] = useState<Session | null>(null);
  const [guest, setGuest] = useState(false);
  useEffect(() => {
    if (!supabase) return;
    supabase.auth.getSession().then(({ data }) => setSession(data.session));
    const { data } = supabase.auth.onAuthStateChange((_e, s) => setSession(s));
    return () => data.subscription.unsubscribe();
  }, []);
  const value: Auth = {
    session, guest,
    continueAsGuest: () => setGuest(true),
    signOut: async () => { setGuest(false); await supabase?.auth.signOut(); },
    // email magic link (no passwords stored in the app)
    signInWithEmail: async (email) => {
      if (!supabase) return 'Login is not connected yet (Sample). Add your Supabase keys in .env.';
      const { error } = await supabase.auth.signInWithOtp({ email, options: { emailRedirectTo: makeRedirectUri() } });
      return error ? error.message : null;
    },
    // OAuth 2.0 with PKCE through the system browser
    signInWithProvider: async (provider) => {
      if (!supabase) return 'Login is not connected yet (Sample). Add your Supabase keys in .env.';
      const redirectTo = makeRedirectUri();
      const { data, error } = await supabase.auth.signInWithOAuth({ provider, options: { redirectTo, skipBrowserRedirect: true } });
      if (error || !data?.url) return error?.message ?? 'Could not start sign in.';
      const result = await WebBrowser.openAuthSessionAsync(data.url, redirectTo);
      if (result.type !== 'success') return null;
      const code = new URL(result.url).searchParams.get('code');
      if (code) { const r = await supabase.auth.exchangeCodeForSession(code); return r.error ? r.error.message : null; }
      return null;
    }
  };
  return <Ctx.Provider value={value}>{children}</Ctx.Provider>;
}

export function useAuth() {
  const v = useContext(Ctx);
  if (!v) throw new Error('useAuth must be inside AuthProvider');
  return v;
}
