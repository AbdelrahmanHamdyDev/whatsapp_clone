import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/Controller/controller.dart';
import 'package:whatsapp_clone/Model/chat.dart';
import 'package:whatsapp_clone/Model/message.dart';
import 'package:whatsapp_clone/View/chatScreen/chatScreen.dart';

class ChatListItem extends StatelessWidget {
  final Chat chat;
  final Message? lastMessage;
  final void Function() onRefresh;

  const ChatListItem({
    super.key,
    required this.chat,
    this.lastMessage,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final user = clone().getUserData(chat.userId);

    return ListTile(
      leading: Hero(
        tag: Key(user.avatarUrl),
        child: CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl),
          radius: 28.r,
        ),
      ),
      title: Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
      subtitle: Text(
        lastMessage?.text ?? "",
        style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: lastMessage != null
          ? Text(
              clone().formatTime(lastMessage!.timestamp),
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            )
          : null,
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              chat: Chat(
                id: chat.id,
                userId: chat.userId,
                lastUpdated: chat.lastUpdated,
              ),
            ),
          ),
        );
        if (result == true) {
          onRefresh();
        }
      },
    );
  }
}
