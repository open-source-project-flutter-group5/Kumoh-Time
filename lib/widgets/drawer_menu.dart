// lib/widgets/drawer_menu.dart
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 2 / 3,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("사용자 이름"),
              accountEmail: Text("user@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('설정'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('로그아웃'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
