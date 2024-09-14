import 'package:flutter/material.dart';
import 'package:flutter_examen_final/widgets/chat_list_widget.dart';
import 'package:flutter_examen_final/widgets/chat_message_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: ChatListWidget()),
        ChatMessageWidget(),
      ],
    );
  }
}