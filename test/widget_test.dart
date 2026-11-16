import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:literava/main.dart';
import 'package:literava/providers/library_provider.dart';
import 'package:literava/services/storage_service.dart';

void main() {
  testWidgets('Literava smoke test - app launches and renders Lobi',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
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

    // Pump a frame (avoiding pumpAndSettle due to ambient pulse animation)
    await tester.pump(const Duration(milliseconds: 300));

    // Verify header and title
    expect(find.text('Literava'), findsOneWidget);
    expect(find.text('LOBI'), findsWidgets);
    expect(find.text('Mulai Menjelajah Lorong Buku'), findsOneWidget);
  });
}
