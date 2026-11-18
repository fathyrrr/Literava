import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  test('extract image from first page', () {
    final pdfs = [
      'menalar tuhan by franz-magnis suseno_231116_110354.pdf',
      'Filsafat_Moral_Pergumulan_Etis_Keseharian_Hidup_Ma_231021_190020.pdf',
    ];

    for (final name in pdfs) {
      final file = File('D:\\Project Pemrograman Mobile\\Daftar Buku + cover\\$name');
      final bytes = file.readAsBytesSync();
      final document = PdfDocument(inputBytes: bytes);
      print('Document $name has ${document.pages.count} pages');
      // Check images in page 0
      try {
        // syncfusion can extract images using PdfPage
        print('Checking page 0 of $name');
      } catch (e) {
        print('Error: $e');
      }
      document.dispose();
    }
  });
}
