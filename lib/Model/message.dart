class Message {
  final String id;
  final String chatId;
  final String senderId; // "me" or user id
  final String text;
  final DateTime timestamp;
  final bool isSeen;

  Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.isSeen = false,
  });
}
