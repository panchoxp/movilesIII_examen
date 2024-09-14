import 'package:flutter/material.dart';
import 'package:flutter_examen_final/services/chat_service.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().getChatMessages(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        final messages = snapshot.data!;
        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return ListTile(
              title: Text(message.text),
              subtitle: Text('User: ${message.userId}'),
              trailing: Text(message.timestamp.toLocal().toString()),
            );
          },
        );
      },
    );
  }
}
