import 'package:whatsapp_clone/Model/chat.dart';
import 'package:whatsapp_clone/Model/status.dart';

class UserModel {
  final String id;
  final String name;
  final String avatarUrl;
  final UserStatus status;
  final StatusModel? statuses;

  UserModel({
    required this.id,
    required this.name,
    required this.status,
    required this.avatarUrl,
    this.statuses,
  });
}
