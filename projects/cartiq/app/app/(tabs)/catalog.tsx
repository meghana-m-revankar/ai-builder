import { useEffect, useState } from 'react';
import { FlatList, Pressable, RefreshControl } from 'react-native';
import { Link } from 'expo-router';
import { getItems } from '@/api';
import { Item } from '@/data';
import { Body, Card, Loading, Notice, SampleBadge, Title, usePalette } from '@/ui';
import { colors, space } from '@/theme';

export default function Catalog() {
  const p = usePalette();
  const [items, setItems] = useState<Item[] | null>(null);
  const [error, setError] = useState(false);
  const load = () => getItems().then(r => setItems(r.items)).catch(() => setError(true));
  useEffect(() => { load(); }, []);
  if (error) return <Notice text="Could not load plans. Pull down to try again." />;
  if (items === null) return <Loading />;
  return (
    <FlatList style={{ backgroundColor: p.canvas }} data={items} keyExtractor={i => i.id}
      contentContainerStyle={{ padding: space(2), gap: space(1.5) }}
      refreshControl={<RefreshControl refreshing={false} onRefresh={load} tintColor={colors.brand} />}
      ListEmptyComponent={<Body muted>No plans yet.</Body>}
      renderItem={({ item }) => (
        <Link href={{ pathname: '/item/[id]', params: { id: item.id } }} asChild>
          <Pressable accessibilityRole="button" accessibilityLabel={item.title}>
            <Card>
              {item.sample && <SampleBadge />}
              <Title size={18}>{item.title}</Title>
              <Body muted>{item.description}</Body>
              <Body>{item.price}</Body>
            </Card>
          </Pressable>
        </Link>
      )} />
  );
}
