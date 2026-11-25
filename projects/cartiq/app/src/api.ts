import AsyncStorage from '@react-native-async-storage/async-storage';
import { items as sampleItems, Item } from './data';

const API_URL = process.env.EXPO_PUBLIC_API_URL ?? '';

/** Loads plans from your API (GET {API_URL}/items). Falls back to the cache, then to sample data. */
export async function getItems(): Promise<{ items: Item[]; offline: boolean }> {
  if (API_URL) {
    try {
      const controller = new AbortController();
      const timer = setTimeout(() => controller.abort(), 10000);
      const res = await fetch(API_URL.replace(/\/$/, '') + '/items', { signal: controller.signal });
      clearTimeout(timer);
      if (!res.ok) throw new Error('HTTP ' + res.status);
      const data = (await res.json()) as Item[];
      await AsyncStorage.setItem('items-cache', JSON.stringify(data));
      return { items: data, offline: false };
    } catch {
      const cached = await AsyncStorage.getItem('items-cache');
      if (cached) return { items: JSON.parse(cached) as Item[], offline: true };
    }
  }
  return { items: sampleItems, offline: false };
}

export async function getItem(id: string): Promise<Item | undefined> {
  return (await getItems()).items.find(i => i.id === id);
}

/** Sends a form (order, booking, enquiry, support) to your API. Without an API it is kept on the phone. */
export async function submitForm(kind: string, payload: Record<string, unknown>): Promise<{ ok: boolean; local: boolean }> {
  if (!API_URL) {
    const key = 'outbox-' + kind;
    const list = JSON.parse((await AsyncStorage.getItem(key)) ?? '[]');
    list.push({ ...payload, at: new Date().toISOString() });
    await AsyncStorage.setItem(key, JSON.stringify(list));
    return { ok: true, local: true };
  }
  const res = await fetch(API_URL.replace(/\/$/, '') + '/' + kind, {
    method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(payload)
  });
  return { ok: res.ok, local: false };
}
