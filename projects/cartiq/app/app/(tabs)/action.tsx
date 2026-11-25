import { useCallback, useState } from 'react';
import { ScrollView, TextInput, Alert, View, Text } from 'react-native';
import { useFocusEffect } from 'expo-router';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { submitForm } from '@/api';
import { items } from '@/data';
import { registerForPush } from '@/notifications';
import { Body, Button, Card, Notice, Title, usePalette } from '@/ui';
import { colors, space, radius } from '@/theme';

export default function Action() {
  const p = usePalette();
  const [basket, setBasket] = useState<string[]>([]);
  const [name, setName] = useState('');
  const [phone, setPhone] = useState('');
  const [note, setNote] = useState('');
  const [errors, setErrors] = useState<Record<string, string>>({});
  useFocusEffect(useCallback(() => { AsyncStorage.getItem('basket').then(v => setBasket(JSON.parse(v ?? '[]'))); }, []));
  const input = { borderWidth: 1, borderColor: p.line, borderRadius: radius.sm, padding: 12, fontSize: 16, color: p.text, backgroundColor: p.bg, minHeight: 48 };

  const send = async () => {
    const e: Record<string, string> = {};
    if (name.trim().length < 2) e.name = 'Please enter your name.';
    if (!/^[+\d][\d\s-]{6,}$/.test(phone.trim())) e.phone = 'Please enter a valid phone number.';
    setErrors(e);
    if (Object.keys(e).length) return;
    const r = await submitForm("support", { name, phone, note, items: basket });
    if (!r.ok) { Alert.alert('Not sent', 'Please try again.'); return; }
    await AsyncStorage.removeItem('basket'); setBasket([]); setNote('');
    Alert.alert('Thank you!', r.local ? 'Saved on your phone (Sample - connect your API to receive it).' : 'We have received your request.');
    registerForPush();
  };

  return (
    <ScrollView style={{ backgroundColor: p.canvas }} contentContainerStyle={{ padding: space(2), gap: space(1.5) }} keyboardShouldPersistTaps="handled">
      <Title>Get support</Title>
      
      <View style={{ gap: 6 }}>
        <Text style={{ color: p.text, fontWeight: '600' }}>Name *</Text>
        <TextInput style={input} value={name} onChangeText={setName} autoComplete="name" accessibilityLabel="Name" />
        {errors.name && <Text style={{ color: '#b42318' }}>{errors.name}</Text>}
      </View>
      <View style={{ gap: 6 }}>
        <Text style={{ color: p.text, fontWeight: '600' }}>Phone *</Text>
        <TextInput style={input} value={phone} onChangeText={setPhone} keyboardType="phone-pad" autoComplete="tel" accessibilityLabel="Phone" />
        {errors.phone && <Text style={{ color: '#b42318' }}>{errors.phone}</Text>}
      </View>
      <View style={{ gap: 6 }}>
        <Text style={{ color: p.text, fontWeight: '600' }}>Message</Text>
        <TextInput style={[input, { minHeight: 96, textAlignVertical: 'top' }]} value={note} onChangeText={setNote} multiline accessibilityLabel="Message" />
      </View>
      <Button label="Send" onPress={send} />
      
    </ScrollView>
  );
}
