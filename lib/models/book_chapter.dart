class BookChapter {
  final String id;
  final String chapterNumber;
  final String title;
  final String subtitle;
  final String content;
  final int estimatedMinutes;

  const BookChapter({
    required this.id,
    required this.chapterNumber,
    required this.title,
    this.subtitle = '',
    required this.content,
    this.estimatedMinutes = 8,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chapterNumber': chapterNumber,
      'title': title,
      'subtitle': subtitle,
      'content': content,
      'estimatedMinutes': estimatedMinutes,
    };
  }

  factory BookChapter.fromJson(Map<String, dynamic> json) {
    return BookChapter(
      id: json['id'] as String? ?? '',
      chapterNumber: json['chapterNumber'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      content: json['content'] as String? ?? '',
      estimatedMinutes: json['estimatedMinutes'] as int? ?? 8,
    );
  }
}
