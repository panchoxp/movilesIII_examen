import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ChatMessage>> getChatMessages() {
    return _firestore.collection('chat_messages').orderBy('timestamp').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => ChatMessage.fromMap(doc.data(), doc.id))
              .toList(),
        );
  }

  Future<void> sendMessage(String text, String userId) async {
    final message = ChatMessage(
      text: text,
      userId: userId,
      timestamp: DateTime.now(), id: '',
    );
    await _firestore.collection('chat_messages').add(message.toMap());
  }
}

class ChatMessage {
  String id;
  String text;
  String userId;
  DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.text,
    required this.userId,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'userId': userId,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static ChatMessage fromMap(Map<String, dynamic> map, String id) {
    return ChatMessage(
      id: id,
      text: map['text'],
      userId: map['userId'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
