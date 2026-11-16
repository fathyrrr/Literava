import 'package:flutter/material.dart';

class GenreLane {
  final String id;
  final String roman;
  final String name;
  final int bookCount;
  final IconData icon;
  final List<String> moodTags;
  final String wingLocation;
  final String shelfNumber;
  final String deweyRange;

  const GenreLane({
    required this.id,
    required this.roman,
    required this.name,
    required this.bookCount,
    required this.icon,
    required this.moodTags,
    required this.wingLocation,
    required this.shelfNumber,
    required this.deweyRange,
  });
}
