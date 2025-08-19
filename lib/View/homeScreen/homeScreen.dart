import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/Controller/controller.dart';
import 'package:whatsapp_clone/View/homeScreen/Widgets/chat_list_item.dart';
import 'package:whatsapp_clone/dummyData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "WhatsApp",
          style: TextStyle(
            color: (Theme.of(context).scaffoldBackgroundColor == Colors.white)
                ? Theme.of(context).primaryColor
                : null,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            /// search bar
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: SearchBar(
                  elevation: WidgetStateProperty.all(1),
                  hintText: "Ask Meta AI or Search",
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).scaffoldBackgroundColor.withValues(
                      alpha: 0.2,
                      red: 1,
                      blue: 1,
                      green: 1,
                    ),
                  ),
                  leading: const Icon(Icons.search),
                ),
              ),
            ),

            /// chat list
            SliverList.separated(
              itemCount: dummyChats.length,
              separatorBuilder: (_, __) => Padding(
                padding: EdgeInsets.only(left: 70.w),
                child: Divider(height: 0.5.h),
              ),
              itemBuilder: (context, index) {
                final chat = dummyChats[index];
                final lastMessage = clone().getLastMessageForChat(chat.id);

                return ChatListItem(
                  chat: chat,
                  lastMessage: lastMessage,
                  onRefresh: () => setState(() {}),
                );
              },
            ),
          ],
        ),
      ),

      /// floating action buttons
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10.h,
        children: [
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surface.withValues(alpha: 2),
            onPressed: () {},
            child: const Icon(Icons.circle_outlined, color: Colors.blue),
          ),
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {},
            child: const Icon(Icons.add_comment, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
