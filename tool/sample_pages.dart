import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  test('test extract specific pages for books', () {
    void dumpSample(String filename, int startPage, int endPage) {
      final file = File('D:\\Project Pemrograman Mobile\\Daftar Buku + cover\\$filename');
      final bytes = file.readAsBytesSync();
      final doc = PdfDocument(inputBytes: bytes);
      final extractor = PdfTextExtractor(doc);
      final text = extractor.extractText(startPageIndex: startPage, endPageIndex: endPage);
      print('=== SAMPLE FOR $filename (pp.$startPage-$endPage) ===');
      print(text.substring(0, text.length > 400 ? 400 : text.length));
      doc.dispose();
    }

    dumpSample('adventureofsherl0000unse.pdf', 15, 17);
    dumpSample('annakareninatols00tolsiala.pdf', 16, 18);
    dumpSample('countofmontecris01duma.pdf', 10, 12);
    dumpSample('Dunia Anna_240515_195909.pdf', 8, 10);
    dumpSample('Filsafat_Moral_Pergumulan_Etis_Keseharian_Hidup_Ma_231021_190020.pdf', 10, 12);
    dumpSample('History of Western Philosophy_231108_221039.pdf', 15, 17);
    dumpSample('immanuel kant.pdf', 12, 14);
    dumpSample('Mitos Sisifus - Albert Camus_240818_013041_240831_201730.pdf', 10, 12);
    dumpSample('mysticism and logic russel.pdf', 12, 14);
    dumpSample('sang-penguasa-the-prince-niccolo-machiavelli_231021_185801.pdf', 10, 12);
    dumpSample('Seruan Zarathustra_240328_141026.pdf', 5, 7);
  });
}
