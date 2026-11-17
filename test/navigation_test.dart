import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:literava/main.dart';
import 'package:literava/providers/library_provider.dart';
import 'package:literava/services/storage_service.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Literava full navigation test between all 4 tabs and reader',
      (WidgetTester tester) async {
    final storageService = StorageService();
    await storageService.init();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => LibraryProvider(storageService),
          ),
        ],
        child: const LiteravaApp(),
      ),
    );

    await tester.pump(const Duration(milliseconds: 300));

    // 1. Verify Lobi Tab content
    expect(find.text('Literava Publica'), findsOneWidget);
    expect(find.text('TIKET MASUK & KARTU PENJELAJAH'), findsOneWidget);

    // 2. Navigate to Kurasi Tab
    await tester.tap(find.text('KURASI'));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('ATRIUM KURASI'), findsOneWidget);
    expect(find.text('Katalog Kartu Lorong'), findsOneWidget);
    expect(find.text('Masuki Lorong'), findsOneWidget);

    // 3. Navigate to Lorong Rak Tab
    await tester.tap(find.text('LORONG RAK'));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Tingkat Atas: Naskah Stoikisme & Etika Romawi'), findsOneWidget);
    expect(find.text('Ambil & Bawa ke Meja Baca'), findsOneWidget);

    // 4. Navigate to Meja Baca Tab
    await tester.tap(find.text('MEJA BACA'));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('MEJA BACA NO. 12'), findsOneWidget);
    expect(find.text('Baca di Tempat'), findsOneWidget);
    expect(find.text('Unduh Arsip PDF'), findsOneWidget);
    expect(find.text('Spesifikasi Arsip Fisik & Digital'), findsOneWidget);

    // 5. Open Reader View via ensureVisible
    final readBtnFinder = find.text('Mulai Membaca Sekarang');
    await tester.ensureVisible(readBtnFinder);
    await tester.pump(const Duration(milliseconds: 300));
    await tester.tap(readBtnFinder);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Di Tepi Sungai Hran (Pagi Hari)'), findsOneWidget);
    expect(find.byIcon(Icons.format_size), findsOneWidget);
  });
}
