import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/Model/user.dart';
import 'package:whatsapp_clone/View/statusScreen/Widgets/statusViewer.dart';

class UserStatusTile extends StatelessWidget {
  const UserStatusTile({
    super.key,
    required this.user,
    required this.onRefresh,
  });

  final UserModel user;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final status = user.statuses;
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: status!.isViewed
                ? Colors.grey
                : Theme.of(context).primaryColor,
            width: 3,
          ),
        ),
        child: Hero(
          tag: Key(user.avatarUrl),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
        ),
      ),
      title: Text(user.name),
      subtitle: Text(DateFormat('hh:mm a').format(status.createdAt)),
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StatusViewer(
              name: user.name,
              userAvatar: user.avatarUrl,
              status: status.imageUrl,
              time: status.createdAt,
            ),
          ),
        );

        status.isViewed = true;
        onRefresh();
      },
    );
  }
}
