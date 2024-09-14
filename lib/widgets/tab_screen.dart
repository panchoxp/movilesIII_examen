import 'package:flutter/material.dart';
import 'package:flutter_examen_final/services/auth_service.dart';
import 'package:flutter_examen_final/widgets/chat_screen.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Navigation"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: "Chat"),
              Tab(icon: Icon(Icons.image), text: "Grid"),
              Tab(icon: Icon(Icons.settings), text: "Ajustes"),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => AuthService().signOut(),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            ChatScreen(),
            Center(child: Text("Hello World! Ajustes")),
            Center(child: Text("Hello World! Ajustes")),
          ],
        ),
      ),
    );
  }
}


