// lib/screens/chat/personal_chat_screen.dart
import 'package:flutter/material.dart';

class PersonalChatScreen extends StatelessWidget {
  const PersonalChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {
        'department': '컴퓨터공학과',
        'message': '내일 뭐하시나요',
      },
      {
        'department': '산업공학과',
        'message': '밥 같이 먹으실래요',
      },
      {
        'department': '기계과',
        'message': '게임 같이 하실래요?',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('개인 채팅방'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(chats[index]['department']!),
              subtitle: Text(chats[index]['message']!),
            ),
          );
        },
      ),
    );
  }
}
