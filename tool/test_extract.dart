import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  test('test extract', () {
    final file = File(r'D:\Project Pemrograman Mobile\Daftar Buku + cover\Seruan Zarathustra_240328_141026.pdf');
    final bytes = file.readAsBytesSync();
    final document = PdfDocument(inputBytes: bytes);

    print('Total Pages: ${document.pages.count}');

    final extractor = PdfTextExtractor(document);
    final text = extractor.extractText(startPageIndex: 0, endPageIndex: 4);
    print('--- PREVIEW TEXT FIRST 5 PAGES ---');
    print(text.substring(0, text.length > 500 ? 500 : text.length));

    document.dispose();
  });
}
