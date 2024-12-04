import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  final String yearTitle;

  const ChatRoomScreen({
    Key? key,
    required this.yearTitle,
  }) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // 임시 메시지 데이터
  final List<Map<String, dynamic>> _messages = [
    {
      'sender': '홍길동',
      'message': '안녕하세요!',
      'isMe': false,
      'time': '오전 10:30',
    },
    {
      'sender': '김철수',
      'message': '과제 제출일이 언제죠?',
      'isMe': false,
      'time': '오전 10:31',
    },
    {
      'sender': '나',
      'message': '다음 주 금요일까지입니다.',
      'isMe': true,
      'time': '오전 10:32',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.yearTitle} 채팅방'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () {
              // 채팅방 멤버 목록
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // 채팅방 설정
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: message['isMe']
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!message['isMe']) ...[
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          child: Text(message['sender'][0]),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Column(
                        crossAxisAlignment: message['isMe']
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          if (!message['isMe'])
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                message['sender'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (message['isMe'])
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Text(
                                    message['time'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: message['isMe']
                                      ? Colors.yellow[200]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: message['isMe']
                                      ? null
                                      : Border.all(color: Colors.grey[300]!),
                                ),
                                child: Text(message['message']),
                              ),
                              if (!message['isMe'])
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    message['time'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      // 추가 기능 (이미지, 파일 등)
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: '메시지를 입력하세요',
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      // 메시지 전송 로직
                      if (_messageController.text.trim().isNotEmpty) {
                        setState(() {
                          _messages.add({
                            'sender': '나',
                            'message': _messageController.text,
                            'isMe': true,
                            'time': '방금',
                          });
                          _messageController.clear();
                          // 스크롤을 가장 아래로
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
