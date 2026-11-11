const contacts = [
  { id: 1, name: "Aisha Al Mansoori", status: "online", avatar: "https://i.pravatar.cc/150?u=1", lastMsg: "See you later!", time: "10:45 AM" },
  { id: 2, name: "Omar Haddad", status: "offline", avatar: "https://i.pravatar.cc/150?u=2", lastMsg: "Meeting at 2pm?", time: "09:30 AM" },
  { id: 3, name: "Sarah Jenkins", status: "online", avatar: "https://i.pravatar.cc/150?u=3", lastMsg: "Did you send the file?", time: "Yesterday" }
];
const messages = {
  1: [
    { sender: "other", text: "Hey! How is it going?" },
    { sender: "own", text: "Pretty good! Working on the new app." },
    { sender: "other", text: "That sounds exciting." },
    { sender: "own", text: "See you later!" }
  ],
  2: [
    { sender: "other", text: "Meeting at 2pm?" },
    { sender: "own", text: "Yes, I will be there." }
  ],
  3: [
    { sender: "other", text: "Did you send the file?" }
  ]
};
