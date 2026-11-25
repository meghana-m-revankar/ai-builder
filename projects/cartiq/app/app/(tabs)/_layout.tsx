import { Tabs } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';
import { colors } from '@/theme';

export default function TabsLayout() {
  return (
    <Tabs screenOptions={{ tabBarActiveTintColor: colors.brand, headerTitleStyle: { fontWeight: '700' }, tabBarLabelStyle: { fontSize: 12 } }}>
      <Tabs.Screen name="index" options={{ title: "CartIq", tabBarLabel: "Home", tabBarIcon: ({ color, size }) => <Ionicons name="home-outline" color={color} size={size} /> }} />
      <Tabs.Screen name="catalog" options={{ title: "Plans", tabBarLabel: "Plans", tabBarIcon: ({ color, size }) => <Ionicons name="pricetags-outline" color={color} size={size} /> }} />
      <Tabs.Screen name="action" options={{ title: "Support", tabBarLabel: "Support", tabBarIcon: ({ color, size }) => <Ionicons name="chatbubbles-outline" color={color} size={size} /> }} />
      <Tabs.Screen name="profile" options={{ title: "Account", tabBarLabel: "Account", tabBarIcon: ({ color, size }) => <Ionicons name="person-outline" color={color} size={size} /> }} />
    </Tabs>
  );
}
