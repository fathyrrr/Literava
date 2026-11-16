import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book_note.dart';

class StorageService {
  static const String _keyBookmarks = 'literava_bookmarks';
  static const String _keyNotes = 'literava_notes';
  static const String _keyLamp = 'literava_lamp_active';
  static const String _keyQuietMode = 'literava_quiet_mode';
  static const String _keySelectedLane = 'literava_selected_lane';

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Bookmarks
  List<String> getBookmarks() {
    return _prefs.getStringList(_keyBookmarks) ?? ['book_meditations'];
  }

  Future<void> setBookmarks(List<String> bookmarks) async {
    await _prefs.setStringList(_keyBookmarks, bookmarks);
  }

  // Notes
  List<BookNote> getNotes() {
    final raw = _prefs.getString(_keyNotes);
    if (raw == null || raw.isEmpty) {
      // Default initial note for demo
      return [
        BookNote(
          id: 'note_initial_1',
          bookId: 'book_meditations',
          bookTitle: 'Meditations (Renungan Jiwa)',
          content:
              '“Kamu memiliki kekuasaan atas pikiranmu — bukan peristiwa di luar. Sadarilah ini, dan kamu akan menemukan kekuatan sejati.”',
          pageNumber: 42,
          createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        ),
      ];
    }
    try {
      final List<dynamic> list = jsonDecode(raw) as List<dynamic>;
      return list.map((item) => BookNote.fromJson(item as Map<String, dynamic>)).toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> saveNotes(List<BookNote> notes) async {
    final raw = jsonEncode(notes.map((n) => n.toJson()).toList());
    await _prefs.setString(_keyNotes, raw);
  }

  // Lamp State
  bool getLampState() {
    return _prefs.getBool(_keyLamp) ?? true;
  }

  Future<void> setLampState(bool active) async {
    await _prefs.setBool(_keyLamp, active);
  }

  // Quiet mode
  bool getQuietMode() {
    return _prefs.getBool(_keyQuietMode) ?? true;
  }

  Future<void> setQuietMode(bool enabled) async {
    await _prefs.setBool(_keyQuietMode, enabled);
  }

  // Selected Lane
  String getSelectedLane() {
    return _prefs.getString(_keySelectedLane) ?? 'lane_2';
  }

  Future<void> setSelectedLane(String laneId) async {
    await _prefs.setString(_keySelectedLane, laneId);
  }
}
