import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_clone/Model/message.dart';
import 'package:whatsapp_clone/Model/user.dart';
import 'package:whatsapp_clone/dummyData.dart';

class clone {
  UserModel getUserData(String userid) {
    return dummyUsers.firstWhere((element) => element.id == userid);
  }

  List<Message> getchatMessages(String chatId) {
    return dummyMessages.where((msg) => msg.chatId == chatId).toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
  }

  String formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    if (difference.inDays == 0) {
      return DateFormat('hh:mm a').format(dateTime);
    } else {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
  }

  Message? getLastMessageForChat(String chatId) {
    final messages = dummyMessages.where((msg) => msg.chatId == chatId).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return messages.isNotEmpty ? messages.first : null;
  }

  void sendMessage({required String chatId, required text}) {
    dummyMessages.add(
      Message(
        id: Uuid().v4(),
        chatId: chatId,
        senderId: "me",
        text: text,
        timestamp: DateTime.now(),
      ),
    );
  }
}
