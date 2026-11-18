import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  test('analyze chapters in text-based pdfs', () {
    final pdfList = [
      'adventureofsherl0000unse.pdf',
      'annakareninatols00tolsiala.pdf',
      'countofmontecris01duma.pdf',
      'Dunia Anna_240515_195909.pdf',
      'Filsafat_Moral_Pergumulan_Etis_Keseharian_Hidup_Ma_231021_190020.pdf',
      'History of Western Philosophy_231108_221039.pdf',
      'immanuel kant.pdf',
      'Mitos Sisifus - Albert Camus_240818_013041_240831_201730.pdf',
      'mysticism and logic russel.pdf',
      'sang-penguasa-the-prince-niccolo-machiavelli_231021_185801.pdf',
      'Seruan Zarathustra_240328_141026.pdf',
    ];

    for (final filename in pdfList) {
      final file = File('D:\\Project Pemrograman Mobile\\Daftar Buku + cover\\$filename');
      final bytes = file.readAsBytesSync();
      final doc = PdfDocument(inputBytes: bytes);
      final extractor = PdfTextExtractor(doc);

      print('========================================');
      print('FILE: $filename (${doc.pages.count} pages)');
      print('========================================');

      // Sample first 15 pages to find table of contents or starting chapter
      for (int i = 0; i < (doc.pages.count < 20 ? doc.pages.count : 20); i++) {
        final text = extractor.extractText(startPageIndex: i, endPageIndex: i);
        final lines = text.split('\n').map((l) => l.trim()).where((l) => l.isNotEmpty).toList();
        for (final line in lines) {
          final lLow = line.toLowerCase();
          if (lLow.startsWith('chapter') ||
              lLow.startsWith('part ') ||
              lLow.startsWith('bab ') ||
              lLow.startsWith('bagian ') ||
              lLow.contains('contents') ||
              lLow.contains('daftar isi')) {
            print('  [p.$i] $line');
          }
        }
      }
      doc.dispose();
    }
  });
}
