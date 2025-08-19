enum UserStatus { online, offline }

class Chat {
  final String id;
  final String userId;
  final DateTime lastUpdated;

  Chat({required this.id, required this.userId, required this.lastUpdated});
}
