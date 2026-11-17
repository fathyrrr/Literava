import 'package:flutter/material.dart';
import '../models/book.dart';
import '../models/genre_lane.dart';
import '../models/book_note.dart';
import '../models/book_highlight.dart';
import '../services/library_service.dart';
import '../services/storage_service.dart';

class LibraryProvider extends ChangeNotifier {
  final StorageService _storageService;

  int _currentNavIndex = 0;
  String _selectedLaneId = 'lane_2';
  String _selectedMood = 'all';
  late Book _activeBook;
  bool _isSpineView = true;
  bool _isLampActive = true;
  bool _isQuietMode = true;
  bool _isPlayingAmbientAudio = false;
  String _ambientAudioType = 'Gesekan Kertas & Bisikan Puisi';
  Set<String> _bookmarkedBookIds = {};
  List<BookNote> _notes = [];
  List<BookHighlight> _highlights = [];

  LibraryProvider(this._storageService) {
    _activeBook = LibraryService.defaultBook;
    _loadFromStorage();
  }

  void _loadFromStorage() {
    _bookmarkedBookIds = _storageService.getBookmarks().toSet();
    _notes = _storageService.getNotes();
    _highlights = _storageService.getHighlights();
    _isLampActive = _storageService.getLampState();
    _isQuietMode = _storageService.getQuietMode();
    _selectedLaneId = _storageService.getSelectedLane();
    notifyListeners();
  }

  // Getters
  int get currentNavIndex => _currentNavIndex;
  String get selectedLaneId => _selectedLaneId;
  String get selectedMood => _selectedMood;
  Book get activeBook => _activeBook;
  bool get isSpineView => _isSpineView;
  bool get isLampActive => _isLampActive;
  bool get isQuietMode => _isQuietMode;
  bool get isPlayingAmbientAudio => _isPlayingAmbientAudio;
  String get ambientAudioType => _ambientAudioType;
  List<BookNote> get notes => _notes;
  List<BookHighlight> get highlights => _highlights;
  List<GenreLane> get allLanes => LibraryService.lanes;
  List<Book> get allBooks => LibraryService.books;

  GenreLane get currentLane => LibraryService.lanes.firstWhere(
        (lane) => lane.id == _selectedLaneId,
        orElse: () => LibraryService.lanes[1],
      );

  List<GenreLane> get filteredLanes {
    if (_selectedMood == 'all') return LibraryService.lanes;
    return LibraryService.lanes
        .where((lane) => lane.moodTags.contains(_selectedMood))
        .toList();
  }

  // Navigation
  void setNavIndex(int index) {
    if (_currentNavIndex != index) {
      _currentNavIndex = index;
      notifyListeners();
    }
  }

  // Selection
  void selectLane(String laneId, {bool navigateToShelf = false}) {
    _selectedLaneId = laneId;
    _storageService.setSelectedLane(laneId);
    if (navigateToShelf) {
      _currentNavIndex = 2; // Jump to Lorong Rak tab
    }
    notifyListeners();
  }

  void selectMood(String mood) {
    _selectedMood = mood;
    notifyListeners();
  }

  void selectBook(Book book, {bool navigateToDesk = false}) {
    _activeBook = book;
    if (navigateToDesk) {
      _currentNavIndex = 3; // Jump to Meja Baca tab
    }
    notifyListeners();
  }

  void toggleSpineView(bool spineView) {
    _isSpineView = spineView;
    notifyListeners();
  }

  // Lamp Toggle
  void toggleLamp() {
    _isLampActive = !_isLampActive;
    _storageService.setLampState(_isLampActive);
    notifyListeners();
  }

  // Bookmarks
  bool isBookmarked(String bookId) {
    return _bookmarkedBookIds.contains(bookId);
  }

  void toggleBookmark(String bookId) {
    if (_bookmarkedBookIds.contains(bookId)) {
      _bookmarkedBookIds.remove(bookId);
    } else {
      _bookmarkedBookIds.add(bookId);
    }
    _storageService.setBookmarks(_bookmarkedBookIds.toList());
    notifyListeners();
  }

  // Notes
  List<BookNote> getNotesForBook(String bookId) {
    return _notes.where((n) => n.bookId == bookId).toList();
  }

  void addNote(String bookId, String bookTitle, String content, int pageNumber) {
    final newNote = BookNote(
      id: 'note_${DateTime.now().millisecondsSinceEpoch}',
      bookId: bookId,
      bookTitle: bookTitle,
      content: content,
      pageNumber: pageNumber,
      createdAt: DateTime.now(),
    );
    _notes.insert(0, newNote);
    _storageService.saveNotes(_notes);
    notifyListeners();
  }

  void deleteNote(String noteId) {
    _notes.removeWhere((n) => n.id == noteId);
    _storageService.saveNotes(_notes);
    notifyListeners();
  }

  // Highlights
  List<BookHighlight> getHighlightsForBook(String bookId) {
    return _highlights.where((h) => h.bookId == bookId).toList();
  }

  void addHighlight({
    required String bookId,
    required String chapterId,
    required String text,
    String note = '',
    required int colorHex,
    bool alsoAddToNotes = true,
    String bookTitle = '',
    int pageNumber = 1,
  }) {
    final newHighlight = BookHighlight(
      id: 'hl_${DateTime.now().millisecondsSinceEpoch}',
      bookId: bookId,
      chapterId: chapterId,
      text: text,
      note: note,
      colorHex: colorHex,
      createdAt: DateTime.now(),
    );
    _highlights.insert(0, newHighlight);
    _storageService.saveHighlights(_highlights);

    if (alsoAddToNotes) {
      addNote(
        bookId,
        bookTitle.isNotEmpty ? bookTitle : _activeBook.title,
        note.isNotEmpty ? '“$text”\n\nCatatan: $note' : '“$text”',
        pageNumber,
      );
    } else {
      notifyListeners();
    }
  }

  void deleteHighlight(String highlightId) {
    _highlights.removeWhere((h) => h.id == highlightId);
    _storageService.saveHighlights(_highlights);
    notifyListeners();
  }

  // Ambient Audio
  void toggleAmbientAudio() {
    _isPlayingAmbientAudio = !_isPlayingAmbientAudio;
    notifyListeners();
  }

  void setAmbientAudioType(String type) {
    _ambientAudioType = type;
    notifyListeners();
  }

  // Quiet Mode Protocol
  void toggleQuietMode() {
    _isQuietMode = !_isQuietMode;
    _storageService.setQuietMode(_isQuietMode);
    notifyListeners();
  }

  // Search
  List<Book> searchBooks(String query) {
    if (query.trim().isEmpty) return allBooks;
    final q = query.toLowerCase();
    return allBooks.where((book) {
      return book.title.toLowerCase().contains(q) ||
          book.author.toLowerCase().contains(q) ||
          book.category.toLowerCase().contains(q) ||
          book.callNumber.toLowerCase().contains(q) ||
          book.deweyCode.toLowerCase().contains(q);
    }).toList();
  }
}
