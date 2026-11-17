import 'book_chapter.dart';

class Book {
  final String id;
  final String title;
  final String subtitle;
  final String author;
  final String year;
  final String callNumber;
  final String deweyCode;
  final int pages;
  final double rating;
  final String category;
  final String laneId;
  final String laneName;
  final int shelfTier; // 1: Atas, 2: Tengah
  final String description;
  final String curatorNotes;
  final String excerptBook;
  final String excerptTitle;
  final String excerptText;
  final double spineWidth;
  final double spineHeight;
  final int spineColor1;
  final int spineColor2;
  final int ribbonColor;
  final String coverImageUrl;
  final String bindingFormat;
  final String paperType;
  final String translator;
  final String copyright;
  final String pdfSize;
  final List<BookChapter> chapters;

  const Book({
    required this.id,
    required this.title,
    this.subtitle = '',
    required this.author,
    required this.year,
    required this.callNumber,
    required this.deweyCode,
    required this.pages,
    required this.rating,
    required this.category,
    required this.laneId,
    required this.laneName,
    required this.shelfTier,
    required this.description,
    required this.curatorNotes,
    required this.excerptBook,
    required this.excerptTitle,
    required this.excerptText,
    required this.spineWidth,
    required this.spineHeight,
    required this.spineColor1,
    required this.spineColor2,
    required this.ribbonColor,
    required this.coverImageUrl,
    this.bindingFormat = 'Hardcover Kulit Kambing Terracotta',
    this.paperType = 'Arches 120 gsm Bebas Asam',
    this.translator = 'Tim Konsorsium Klasika',
    this.copyright = 'Domain Publik (Public Domain)',
    this.pdfSize = '12.4 MB',
    this.chapters = const [],
  });

  List<BookChapter> get effectiveChapters {
    if (chapters.isNotEmpty) return chapters;
    return [
      BookChapter(
        id: '${id}_ch1',
        chapterNumber: excerptBook.isNotEmpty ? excerptBook : 'Bab I',
        title: excerptTitle.isNotEmpty ? excerptTitle : title,
        content: excerptText,
      ),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'author': author,
      'year': year,
      'callNumber': callNumber,
      'deweyCode': deweyCode,
      'pages': pages,
      'rating': rating,
      'category': category,
      'laneId': laneId,
      'laneName': laneName,
      'shelfTier': shelfTier,
      'description': description,
      'curatorNotes': curatorNotes,
      'excerptBook': excerptBook,
      'excerptTitle': excerptTitle,
      'excerptText': excerptText,
      'spineWidth': spineWidth,
      'spineHeight': spineHeight,
      'spineColor1': spineColor1,
      'spineColor2': spineColor2,
      'ribbonColor': ribbonColor,
      'coverImageUrl': coverImageUrl,
      'bindingFormat': bindingFormat,
      'paperType': paperType,
      'translator': translator,
      'copyright': copyright,
      'pdfSize': pdfSize,
    };
  }
}
