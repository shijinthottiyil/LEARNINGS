class PostModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  // Factory method to create a PostModel from a JSON Map
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );
  }

  // Method to convert the object back to JSON (useful for POST requests)
  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }

  @override
  String toString() {
    return 'PostModel(id: $id, userId: $userId, title: $title)';
  }
}
