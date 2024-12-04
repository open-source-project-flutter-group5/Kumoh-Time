import 'package:flutter/material.dart';
import 'chat_room_screen.dart';

class DepartmentChatScreen extends StatefulWidget {
  const DepartmentChatScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentChatScreen> createState() => _DepartmentChatScreenState();
}

class _DepartmentChatScreenState extends State<DepartmentChatScreen> {
  final List<Map<String, dynamic>> _yearChatRooms = [
    {
      'year': '1학년',
      'description': '1학년 채팅방입니다.',
      'members': 45,
    },
    {
      'year': '2학년',
      'description': '2학년 채팅방입니다.',
      'members': 52,
    },
    {
      'year': '3학년',
      'description': '3학년 채팅방입니다.',
      'members': 48,
    },
    {
      'year': '4학년',
      'description': '4학년 채팅방입니다.',
      'members': 50,
    },
    {
      'year': '전체 채팅방',
      'description': '학과 전체 채팅방입니다.',
      'members': 195,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.grey[100],
          child: Row(
            children: [
              const Icon(Icons.school, size: 24),
              const SizedBox(width: 8),
              Text(
                '컴퓨터공학과',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: _yearChatRooms.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatRoomScreen(
                        yearTitle: _yearChatRooms[index]['year'],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.blue[400],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _yearChatRooms[index]['year'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _yearChatRooms[index]['description'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${_yearChatRooms[index]['members']}명',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
