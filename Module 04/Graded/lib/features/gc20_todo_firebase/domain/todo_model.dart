/// Todo item for Firestore.
class TodoModel {
  const TodoModel({
    required this.id,
    required this.title,
    this.completed = false,
  });

  factory TodoModel.fromMap(String id, Map<String, dynamic> map) {
    return TodoModel(
      id: id,
      title: map['title'] as String? ?? '',
      completed: map['completed'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'completed': completed,
      };

  TodoModel copyWith({bool? completed}) =>
      TodoModel(id: id, title: title, completed: completed ?? this.completed);

  final String id;
  final String title;
  final bool completed;
}
