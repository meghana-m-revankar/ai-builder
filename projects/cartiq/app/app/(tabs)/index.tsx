import { useEffect, useState } from 'react';
import { ScrollView, View, Pressable, RefreshControl, Text } from 'react-native';
import { Link } from 'expo-router';
import { getItems } from '@/api';
import { Item, businessName } from '@/data';
import { Body, Card, Loading, Notice, SampleBadge, Title, usePalette } from '@/ui';
import { colors, fonts, space, radius } from '@/theme';

export default function Home() {
  const p = usePalette();
  const [items, setItems] = useState<Item[] | null>(null);
  const [offline, setOffline] = useState(false);
  const load = () => getItems().then(r => { setItems(r.items); setOffline(r.offline); });
  useEffect(() => { load(); }, []);
  return (
    <ScrollView style={{ backgroundColor: p.canvas }} contentContainerStyle={{ padding: space(2), gap: space(2) }}
      refreshControl={<RefreshControl refreshing={items === null} onRefresh={load} tintColor={colors.brand} />}>
      {offline && <Notice text="You're offline - showing saved content." />}
      <View style={{ backgroundColor: colors.brand, borderRadius: radius.lg, padding: space(3), gap: space(1) }}>
        <Text accessibilityRole="header" style={{ color: '#fff', fontSize: 28, fontFamily: fonts.display, fontWeight: fonts.display === 'System' ? '700' : undefined }}>{businessName}</Text>
        <Text style={{ color: '#fff', fontSize: 16, lineHeight: 24, fontFamily: fonts.body }}>Welcome! Browse our plans and get in touch in a few taps.</Text>
      </View>
      <Title size={20}>Featured</Title>
      {items === null ? <Loading /> : items.slice(0, 3).map(it => (
        <Link key={it.id} href={{ pathname: '/item/[id]', params: { id: it.id } }} asChild>
          <Pressable accessibilityRole="button" accessibilityLabel={it.title}>
            <Card>
              {it.sample && <SampleBadge />}
              <Title size={18}>{it.title}</Title>
              <Body muted>{it.description}</Body>
              <Body>{it.price}</Body>
            </Card>
          </Pressable>
        </Link>
      ))}
    </ScrollView>
  );
}
