import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone/View/statusScreen/Widgets/user_status_tile.dart';
import 'package:whatsapp_clone/dummyData.dart';

class statusScreen extends StatefulWidget {
  const statusScreen({super.key});

  @override
  State<statusScreen> createState() => _statusScreenState();
}

class _statusScreenState extends State<statusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Status"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: const AssetImage("Assets/Hamdy.png"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.add, size: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
            title: const Text("My Status"),
            subtitle: const Text("Tap to add status update"),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Recent updates",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),

          // Other statuses
          ...dummyUsers.where((user) => user.statuses != null).map((user) {
            return UserStatusTile(user: user, onRefresh: () => setState(() {}));
          }),
        ],
      ),
      floatingActionButton: Column(
        spacing: 12.h,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            onPressed: () {},
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surface.withValues(alpha: 2),
            child: const Icon(Icons.edit),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {},
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
