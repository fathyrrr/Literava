import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  test('generate library books data file', () {
    print('Starting book text extraction...');
    final pdfDir = r'D:\Project Pemrograman Mobile\Daftar Buku + cover';

    String extractClean(String filename, int startPage, int endPage, {int maxLen = 3500}) {
      try {
        final file = File('$pdfDir\\$filename');
        if (!file.existsSync()) return '';
        final bytes = file.readAsBytesSync();
        final doc = PdfDocument(inputBytes: bytes);
        final extractor = PdfTextExtractor(doc);
        final raw = extractor.extractText(startPageIndex: startPage, endPageIndex: endPage);
        doc.dispose();

        // Clean up common PDF text artifacts
        var clean = raw
            .replaceAll(RegExp(r'\r\n|\r'), '\n')
            // Remove standalone page numbers or headers
            .replaceAll(RegExp(r'^\s*\d+\s*$', multiLine: true), '')
            .replaceAll(RegExp(r'^\s*[A-Z\s]{4,}\s*$', multiLine: true), '')
            // Normalize multi-spaces
            .replaceAll(RegExp(r'[ \t]+'), ' ')
            // Normalize paragraphs
            .replaceAll(RegExp(r'\n{3,}'), '\n\n')
            .trim();

        if (clean.length > maxLen) {
          final cut = clean.lastIndexOf('.', maxLen);
          if (cut != -1) {
            clean = clean.substring(0, cut + 1);
          } else {
            clean = clean.substring(0, maxLen);
          }
        }
        return clean;
      } catch (e) {
        print('Error extracting $filename: $e');
        return '';
      }
    }

    final sherlockCh1 = extractClean('adventureofsherl0000unse.pdf', 14, 18);
    final sherlockCh2 = extractClean('adventureofsherl0000unse.pdf', 43, 47);
    final sherlockCh3 = extractClean('adventureofsherl0000unse.pdf', 72, 76);

    final annaCh1 = extractClean('annakareninatols00tolsiala.pdf', 16, 18);
    final annaCh2 = extractClean('annakareninatols00tolsiala.pdf', 19, 21);
    final annaCh3 = extractClean('annakareninatols00tolsiala.pdf', 22, 25);

    final dumasCh1 = extractClean('countofmontecris01duma.pdf', 12, 16);
    final dumasCh2 = extractClean('countofmontecris01duma.pdf', 24, 28);
    final dumasCh3 = extractClean('countofmontecris01duma.pdf', 36, 40);

    final duniaAnnaCh1 = extractClean('Dunia Anna_240515_195909.pdf', 8, 12);
    final duniaAnnaCh2 = extractClean('Dunia Anna_240515_195909.pdf', 16, 20);
    final duniaAnnaCh3 = extractClean('Dunia Anna_240515_195909.pdf', 30, 34);

    final moralCh1 = extractClean('Filsafat_Moral_Pergumulan_Etis_Keseharian_Hidup_Ma_231021_190020.pdf', 9, 13);
    final moralCh2 = extractClean('Filsafat_Moral_Pergumulan_Etis_Keseharian_Hidup_Ma_231021_190020.pdf', 18, 22);
    final moralCh3 = extractClean('Filsafat_Moral_Pergumulan_Etis_Keseharian_Hidup_Ma_231021_190020.pdf', 30, 34);

    final russellHistCh1 = extractClean('History of Western Philosophy_231108_221039.pdf', 23, 27);
    final russellHistCh2 = extractClean('History of Western Philosophy_231108_221039.pdf', 35, 39);
    final russellHistCh3 = extractClean('History of Western Philosophy_231108_221039.pdf', 90, 94);

    final kantCh1 = extractClean('immanuel kant.pdf', 12, 16);
    final kantCh2 = extractClean('immanuel kant.pdf', 24, 28);
    final kantCh3 = extractClean('immanuel kant.pdf', 45, 49);

    final sisifusCh1 = extractClean('Mitos Sisifus - Albert Camus_240818_013041_240831_201730.pdf', 6, 10);
    final sisifusCh2 = extractClean('Mitos Sisifus - Albert Camus_240818_013041_240831_201730.pdf', 12, 16);
    final sisifusCh3 = extractClean('Mitos Sisifus - Albert Camus_240818_013041_240831_201730.pdf', 115, 120);

    final russellMystCh1 = extractClean('mysticism and logic russel.pdf', 12, 16);
    final russellMystCh2 = extractClean('mysticism and logic russel.pdf', 40, 44);
    final russellMystCh3 = extractClean('mysticism and logic russel.pdf', 54, 58);

    final princeCh1 = extractClean('sang-penguasa-the-prince-niccolo-machiavelli_231021_185801.pdf', 9, 13);
    final princeCh2 = extractClean('sang-penguasa-the-prince-niccolo-machiavelli_231021_185801.pdf', 20, 24);
    final princeCh3 = extractClean('sang-penguasa-the-prince-niccolo-machiavelli_231021_185801.pdf', 80, 84);

    final nietzscheCh1 = extractClean('Seruan Zarathustra_240328_141026.pdf', 5, 8);
    final nietzscheCh2 = extractClean('Seruan Zarathustra_240328_141026.pdf', 9, 12);
    final nietzscheCh3 = extractClean('Seruan Zarathustra_240328_141026.pdf', 19, 23);

    print('Extracted Sherlock Ch1 len: ${sherlockCh1.length}');
    print('Extracted Anna Ch1 len: ${annaCh1.length}');
    print('Extracted Dumas Ch1 len: ${dumasCh1.length}');
    print('Extracted Nietzsche Ch1 len: ${nietzscheCh1.length}');

    final outDir = Directory('D:\\Project Pemrograman Mobile\\literava\\lib\\data');
    if (!outDir.existsSync()) outDir.createSync(recursive: true);

    final extractedJsonFile = File('D:\\Project Pemrograman Mobile\\literava\\lib\\data\\extracted_texts.json');
    extractedJsonFile.writeAsStringSync('''
{
  "sherlockCh1": ${sherlockCh1.isNotEmpty ? _escapeJson(sherlockCh1) : '""'},
  "sherlockCh2": ${sherlockCh2.isNotEmpty ? _escapeJson(sherlockCh2) : '""'},
  "sherlockCh3": ${sherlockCh3.isNotEmpty ? _escapeJson(sherlockCh3) : '""'},
  "annaCh1": ${annaCh1.isNotEmpty ? _escapeJson(annaCh1) : '""'},
  "annaCh2": ${annaCh2.isNotEmpty ? _escapeJson(annaCh2) : '""'},
  "annaCh3": ${annaCh3.isNotEmpty ? _escapeJson(annaCh3) : '""'},
  "dumasCh1": ${dumasCh1.isNotEmpty ? _escapeJson(dumasCh1) : '""'},
  "dumasCh2": ${dumasCh2.isNotEmpty ? _escapeJson(dumasCh2) : '""'},
  "dumasCh3": ${dumasCh3.isNotEmpty ? _escapeJson(dumasCh3) : '""'},
  "duniaAnnaCh1": ${duniaAnnaCh1.isNotEmpty ? _escapeJson(duniaAnnaCh1) : '""'},
  "duniaAnnaCh2": ${duniaAnnaCh2.isNotEmpty ? _escapeJson(duniaAnnaCh2) : '""'},
  "duniaAnnaCh3": ${duniaAnnaCh3.isNotEmpty ? _escapeJson(duniaAnnaCh3) : '""'},
  "moralCh1": ${moralCh1.isNotEmpty ? _escapeJson(moralCh1) : '""'},
  "moralCh2": ${moralCh2.isNotEmpty ? _escapeJson(moralCh2) : '""'},
  "moralCh3": ${moralCh3.isNotEmpty ? _escapeJson(moralCh3) : '""'},
  "russellHistCh1": ${russellHistCh1.isNotEmpty ? _escapeJson(russellHistCh1) : '""'},
  "russellHistCh2": ${russellHistCh2.isNotEmpty ? _escapeJson(russellHistCh2) : '""'},
  "russellHistCh3": ${russellHistCh3.isNotEmpty ? _escapeJson(russellHistCh3) : '""'},
  "kantCh1": ${kantCh1.isNotEmpty ? _escapeJson(kantCh1) : '""'},
  "kantCh2": ${kantCh2.isNotEmpty ? _escapeJson(kantCh2) : '""'},
  "kantCh3": ${kantCh3.isNotEmpty ? _escapeJson(kantCh3) : '""'},
  "sisifusCh1": ${sisifusCh1.isNotEmpty ? _escapeJson(sisifusCh1) : '""'},
  "sisifusCh2": ${sisifusCh2.isNotEmpty ? _escapeJson(sisifusCh2) : '""'},
  "sisifusCh3": ${sisifusCh3.isNotEmpty ? _escapeJson(sisifusCh3) : '""'},
  "russellMystCh1": ${russellMystCh1.isNotEmpty ? _escapeJson(russellMystCh1) : '""'},
  "russellMystCh2": ${russellMystCh2.isNotEmpty ? _escapeJson(russellMystCh2) : '""'},
  "russellMystCh3": ${russellMystCh3.isNotEmpty ? _escapeJson(russellMystCh3) : '""'},
  "princeCh1": ${princeCh1.isNotEmpty ? _escapeJson(princeCh1) : '""'},
  "princeCh2": ${princeCh2.isNotEmpty ? _escapeJson(princeCh2) : '""'},
  "princeCh3": ${princeCh3.isNotEmpty ? _escapeJson(princeCh3) : '""'},
  "nietzscheCh1": ${nietzscheCh1.isNotEmpty ? _escapeJson(nietzscheCh1) : '""'},
  "nietzscheCh2": ${nietzscheCh2.isNotEmpty ? _escapeJson(nietzscheCh2) : '""'},
  "nietzscheCh3": ${nietzscheCh3.isNotEmpty ? _escapeJson(nietzscheCh3) : '""'}
}
''');

    print('Wrote extracted_texts.json successfully!');
  });
}

String _escapeJson(String s) {
  final clean = s
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\r', '')
      .replaceAll('\t', '\\t');
  return '"$clean"';
}
