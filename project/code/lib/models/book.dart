class Book {
  final int? id;
  final String title;
  final String auth;
  final String description;
  final String imageUrl;
  Book(
      {this.id,
      required this.title,
      required this.auth,
      required this.description,
      required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'auth': auth,
      'description': description,
      'imageUrl': imageUrl
    };
  }

  static Book fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      auth: map['auth'],
      description: map['description'],
      imageUrl: map['imageUrl'],
    );
  }
}
