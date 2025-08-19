class StatusModel {
  final String id;
  final String imageUrl;
  final DateTime createdAt;
  bool isViewed;

  StatusModel({
    required this.id,
    required this.imageUrl,
    required this.createdAt,
    this.isViewed = false,
  });
}
