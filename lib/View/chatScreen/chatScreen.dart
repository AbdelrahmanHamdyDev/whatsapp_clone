import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/Controller/controller.dart';
import 'package:whatsapp_clone/Model/chat.dart';
import 'package:whatsapp_clone/Model/user.dart';
import 'package:whatsapp_clone/View/chatScreen/Widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;

  const ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    messageController = TextEditingController();
    messageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = clone().getUserData(widget.chat.userId);
    final chatMessages = clone().getchatMessages(widget.chat.id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          spacing: 12.w,
          children: [
            Hero(
              tag: Key(user.avatarUrl),
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatarUrl),
                radius: 20.r,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                if (user.status == UserStatus.online)
                  Text(user.status.name, style: TextStyle(fontSize: 10.sp)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),

      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            Navigator.pop(context, true);
          }
        },
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("Assets/BackGround.png"),
                fit: BoxFit.fill,
                opacity: 0.5,
                colorFilter:
                    (Theme.of(context).scaffoldBackgroundColor == Colors.white)
                    ? null
                    : const ColorFilter.matrix([
                        -1, 0, 0, 0, 255, // R
                        0, -1, 0, 0, 255, // G
                        0, 0, -1, 0, 255, // B
                        0, 0, 0, 1, 0, // A
                      ]),
              ),
            ),
            child: Column(
              children: [
                /// Messages List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 8.h,
                    ),
                    itemCount: chatMessages.length,
                    itemBuilder: (context, index) {
                      final msg = chatMessages[index];
                      final isMe = msg.senderId == "me";

                      final animate = index == chatMessages.length - 1 && isMe;

                      return messageBubble(
                        text: msg.text,
                        timestamp: msg.timestamp,
                        isMe: isMe,
                        animate: animate,
                      );
                    },
                  ),
                ),

                /// Message Input
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.emoji_emotions_outlined),
                                onPressed: () {},
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  child: TextField(
                                    controller: messageController,
                                    decoration: InputDecoration(
                                      hintText: "Message",
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: Theme.of(
                                        context,
                                      ).scaffoldBackgroundColor,
                                    ),
                                    style: const TextStyle(fontSize: 14),
                                    minLines: 1,
                                    maxLines: 5,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.attach_file),
                                onPressed: () {},
                              ),
                              if (messageController.text.isEmpty)
                                IconButton(
                                  icon: const Icon(Icons.camera_alt),
                                  onPressed: () {},
                                ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: messageController.text.isNotEmpty
                            ? InkWell(
                                onTap: () => {
                                  clone().sendMessage(
                                    chatId: widget.chat.id,
                                    text: messageController.text,
                                  ),
                                  messageController.text == "",
                                  setState(() {}),
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Theme.of(
                                    context,
                                  ).scaffoldBackgroundColor,
                                ),
                              )
                            : Icon(
                                Icons.mic,
                                color: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
