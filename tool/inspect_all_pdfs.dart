import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  test('inspect all 16 PDFs', () {
    final dir = Directory(r'D:\Project Pemrograman Mobile\Daftar Buku + cover');
    final pdfFiles = dir.listSync().whereType<File>().where((f) => f.path.toLowerCase().endsWith('.pdf')).toList();

    print('Found ${pdfFiles.length} PDF files.');

    for (var i = 0; i < pdfFiles.length; i++) {
      final file = pdfFiles[i];
      final basename = file.uri.pathSegments.last;
      try {
        final bytes = file.readAsBytesSync();
        final document = PdfDocument(inputBytes: bytes);
        final pageCount = document.pages.count;
        final extractor = PdfTextExtractor(document);
        // Extract text from page 1 to 5 to see TOC or title
        final samplePages = pageCount > 5 ? 5 : pageCount;
        final sampleText = extractor.extractText(startPageIndex: 0, endPageIndex: samplePages - 1);
        final cleanSample = sampleText.replaceAll(RegExp(r'\s+'), ' ').trim();
        final preview = cleanSample.length > 200 ? cleanSample.substring(0, 200) : cleanSample;
        print('[$i] $basename | Pages: $pageCount | Preview: $preview');
        document.dispose();
      } catch (e) {
        print('[$i] ERROR reading $basename: $e');
      }
    }
  });
}
