import { useEffect, useState } from 'react';
import { ScrollView, Alert } from 'react-native';
import { useLocalSearchParams, router } from 'expo-router';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { getItem } from '@/api';
import { Item } from '@/data';
import { Body, Button, Loading, SampleBadge, Title, usePalette } from '@/ui';
import { space } from '@/theme';

export default function ItemDetail() {
  const p = usePalette();
  const { id } = useLocalSearchParams<{ id: string }>();
  const [item, setItem] = useState<Item | null | undefined>(null);
  useEffect(() => { getItem(String(id)).then(setItem); }, [id]);
  if (item === null) return <Loading />;
  if (!item) return <Body muted>Not found.</Body>;
  const addToList = async () => {
    const list = JSON.parse((await AsyncStorage.getItem('basket')) ?? '[]');
    list.push(item.id);
    await AsyncStorage.setItem('basket', JSON.stringify(list));
    Alert.alert('Added', item.title + ' was added.', [{ text: 'Continue' }, { text: 'View', onPress: () => router.push('/(tabs)/action') }]);
  };
  return (
    <ScrollView style={{ backgroundColor: p.canvas }} contentContainerStyle={{ padding: space(2), gap: space(1.5) }}>
      {item.sample && <SampleBadge />}
      <Title>{item.title}</Title>
      <Body muted>{item.description}</Body>
      <Title size={20}>{item.price}</Title>
      <Button label="Choose this plan" onPress={addToList} />
    </ScrollView>
  );
}
