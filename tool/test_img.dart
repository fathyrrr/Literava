import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  test('test extract images', () {
    final file = File(r'D:\Project Pemrograman Mobile\Daftar Buku + cover\menalar tuhan by franz-magnis suseno_231116_110354.pdf');
    final doc = PdfDocument(inputBytes: file.readAsBytesSync());
    print('Pages: ${doc.pages.count}');
    // Check if doc.pages[0] has any image extraction
    doc.dispose();
  });
}
