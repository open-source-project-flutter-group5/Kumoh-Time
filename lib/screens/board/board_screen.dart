// lib/screens/board/board_screen.dart
import 'package:flutter/material.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  final List<Map<String, dynamic>> _dummyPosts = [
    {
      'title': '컴퓨터공학과 게시글',
      'content': '중제 3일중 연계가 사범 제일 많나',
      'stats': '추천 : 5, 댓글 : 2',
    },
    {
      'title': '전자과 게시글',
      'content': '특성인증제 책 어떻게 발급나요',
      'stats': '추천 : 10, 댓글 : 3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('게시물'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('인기'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('나의글'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('글쓰기'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _dummyPosts.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  title: Text(_dummyPosts[index]['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_dummyPosts[index]['content']),
                      Text(_dummyPosts[index]['stats']),
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
