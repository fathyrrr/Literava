class BookNote {
  final String id;
  final String bookId;
  final String bookTitle;
  final String content;
  final int pageNumber;
  final DateTime createdAt;

  BookNote({
    required this.id,
    required this.bookId,
    required this.bookTitle,
    required this.content,
    this.pageNumber = 1,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookId': bookId,
      'bookTitle': bookTitle,
      'content': content,
      'pageNumber': pageNumber,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory BookNote.fromJson(Map<String, dynamic> json) {
    return BookNote(
      id: json['id'] as String,
      bookId: json['bookId'] as String,
      bookTitle: json['bookTitle'] as String,
      content: json['content'] as String,
      pageNumber: json['pageNumber'] as int? ?? 1,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
