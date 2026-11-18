import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  test('inspect specific pdfs deeper', () {
    final targets = [
      'Dunia Sophie Ebooks_240113_141458.pdf',
      'Homo Deus by Yuval Noah Harari_240215_092803.pdf',
      'menalar tuhan by franz-magnis suseno_231116_110354.pdf',
      'rhetorics.pdf',
      'sejarah-tuhan_240528_190013.pdf',
    ];

    for (final name in targets) {
      final file = File('D:\\Project Pemrograman Mobile\\Daftar Buku + cover\\$name');
      final bytes = file.readAsBytesSync();
      final document = PdfDocument(inputBytes: bytes);
      final extractor = PdfTextExtractor(document);

      print('=== Checking $name (Total: ${document.pages.count} pages) ===');
      bool foundText = false;
      // sample every 5 pages up to 50
      for (int p = 5; p < (document.pages.count < 60 ? document.pages.count : 60); p += 5) {
        final text = extractor.extractText(startPageIndex: p, endPageIndex: p + 1);
        final clean = text.replaceAll(RegExp(r'\s+'), ' ').trim();
        if (clean.isNotEmpty) {
          print('  Page $p has text: ${clean.length > 120 ? clean.substring(0, 120) : clean}');
          foundText = true;
          break;
        }
      }
      if (!foundText) {
        print('  NO TEXT extracted up to page 60! Might be scanned images or raster.');
      }
      document.dispose();
    }
  });
}
