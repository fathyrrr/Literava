class BookHighlight {
  final String id;
  final String bookId;
  final String chapterId;
  final String text;
  final String note;
  final int colorHex;
  final DateTime createdAt;

  BookHighlight({
    required this.id,
    required this.bookId,
    required this.chapterId,
    required this.text,
    this.note = '',
    required this.colorHex,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookId': bookId,
      'chapterId': chapterId,
      'text': text,
      'note': note,
      'colorHex': colorHex,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory BookHighlight.fromJson(Map<String, dynamic> json) {
    return BookHighlight(
      id: json['id'] as String? ?? '',
      bookId: json['bookId'] as String? ?? '',
      chapterId: json['chapterId'] as String? ?? '',
      text: json['text'] as String? ?? '',
      note: json['note'] as String? ?? '',
      colorHex: json['colorHex'] as int? ?? 0xFFE08850,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}
