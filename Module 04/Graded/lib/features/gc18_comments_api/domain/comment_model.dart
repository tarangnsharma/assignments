/// Model for a comment from JSONPlaceholder API.
class CommentModel {
  const CommentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      body: json['body'] as String? ?? '',
    );
  }

  final int id;
  final String name;
  final String email;
  final String body;
}
