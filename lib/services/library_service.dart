import 'package:flutter/material.dart';
import '../data/library_books_data.dart';
import '../models/book.dart';
import '../models/genre_lane.dart';

class LibraryService {
  static final List<GenreLane> lanes = [
    const GenreLane(
      id: 'lane_1',
      roman: 'I',
      name: 'Fiksi Klasik & Epik',
      bookCount: 3420,
      icon: Icons.auto_stories,
      moodTags: ['all', 'nostalgia', 'reflective'],
      wingLocation: 'Lantai 1 Sayap Timur',
      shelfNumber: 'Rak Oak No. 01',
      deweyRange: 'Dewey 800-899',
    ),
    const GenreLane(
      id: 'lane_2',
      roman: 'II',
      name: 'Filsafat & Kebijaksanaan',
      bookCount: 1890,
      icon: Icons.hourglass_empty,
      moodTags: ['all', 'reflective', 'philosophy'],
      wingLocation: 'Lantai 2 Sayap Barat',
      shelfNumber: 'Rak Mahoni No. 04',
      deweyRange: 'Dewey 100-199',
    ),
    const GenreLane(
      id: 'lane_3',
      roman: 'III',
      name: 'Arsitektur, Seni & Tipografi',
      bookCount: 940,
      icon: Icons.architecture,
      moodTags: ['all', 'reflective'],
      wingLocation: 'Lantai 2 Mezzanine',
      shelfNumber: 'Rak Walnut No. 08',
      deweyRange: 'Dewey 700-799',
    ),
    const GenreLane(
      id: 'lane_4',
      roman: 'IV',
      name: 'Sejarah & Manuskrip Kuno',
      bookCount: 2110,
      icon: Icons.history_edu,
      moodTags: ['all', 'nostalgia'],
      wingLocation: 'Lantai Bawah Tanah (Arsip Kuno)',
      shelfNumber: 'Rak Besi Tempa No. 12',
      deweyRange: 'Dewey 900-999',
    ),
    const GenreLane(
      id: 'lane_5',
      roman: 'V',
      name: 'Puisi & Surat Cinta Klasik',
      bookCount: 680,
      icon: Icons.edit_note,
      moodTags: ['all', 'reflective', 'nostalgia'],
      wingLocation: 'Lantai 3 Loteng Timur',
      shelfNumber: 'Rak Cedar No. 03',
      deweyRange: 'Dewey 811-821',
    ),
    const GenreLane(
      id: 'lane_6',
      roman: 'VI',
      name: 'Sains Purba & Astronomi',
      bookCount: 1240,
      icon: Icons.travel_explore,
      moodTags: ['all', 'science'],
      wingLocation: 'Lantai 4 Observatorium',
      shelfNumber: 'Rak Kuningan No. 02',
      deweyRange: 'Dewey 500-599',
    ),
  ];

  static List<Book> get books => LibraryBooksData.books;

  static Book get defaultBook => books.firstWhere(
        (b) => b.id == 'book_dunia_sophie',
        orElse: () => books.first,
      );

  static List<Book> getBooksByLane(String laneId) {
    return books.where((b) => b.laneId == laneId).toList();
  }

  static List<Book> getBooksByTier(int tier) {
    return books.where((b) => b.shelfTier == tier).toList();
  }
}
