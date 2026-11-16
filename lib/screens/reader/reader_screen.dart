import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../models/book.dart';
import '../meja_baca/dialogs/notes_dialog.dart';

enum ReaderTheme { linen, sepia, dark }

class ReaderScreen extends StatefulWidget {
  final Book book;

  const ReaderScreen({super.key, required this.book});

  static void open(BuildContext context, Book book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ReaderScreen(book: book),
      ),
    );
  }

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  double _fontSize = 17.0;
  ReaderTheme _theme = ReaderTheme.linen;
  final ScrollController _scrollCtrl = ScrollController();
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.hasClients) {
        final max = _scrollCtrl.position.maxScrollExtent;
        final current = _scrollCtrl.offset;
        setState(() {
          _progress = (max > 0) ? (current / max).clamp(0.0, 1.0) : 0.0;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  Color get _bgColor {
    switch (_theme) {
      case ReaderTheme.linen:
        return const Color(0xFFFAF5EE);
      case ReaderTheme.sepia:
        return const Color(0xFFF4ECD8);
      case ReaderTheme.dark:
        return const Color(0xFF1E1713);
    }
  }

  Color get _textColor {
    switch (_theme) {
      case ReaderTheme.linen:
        return const Color(0xFF3A302A);
      case ReaderTheme.sepia:
        return const Color(0xFF433422);
      case ReaderTheme.dark:
        return const Color(0xFFECE6DC);
    }
  }

  Color get _accentColor {
    return _theme == ReaderTheme.dark
        ? const Color(0xFFE08850)
        : AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Reader Navigation & Settings Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _theme == ReaderTheme.dark
                        ? Colors.white12
                        : const Color(0x33D8D0C8),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 18, color: _textColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          book.title,
                          style: GoogleFonts.ebGaramond(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _textColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${(_progress * 100).toInt()}% • ${book.excerptBook}',
                          style: GoogleFonts.manrope(
                            fontSize: 10,
                            color: _accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      // Font size menu
                      IconButton(
                        icon: Icon(Icons.format_size, size: 20, color: _textColor),
                        onPressed: _showTypographySheet,
                      ),
                      // Quick note
                      IconButton(
                        icon: Icon(Icons.edit_note, size: 22, color: _textColor),
                        onPressed: () => NotesSheet.show(context, book),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Reading Progress Bar
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(_accentColor),
              minHeight: 2,
            ),

            // Main Reader Content Area
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollCtrl,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Chapter Header
                    Center(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _accentColor.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              book.excerptBook.toUpperCase(),
                              style: GoogleFonts.manrope(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: _accentColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            book.excerptTitle,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ebGaramond(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: _textColor,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            book.author,
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: _textColor.withValues(alpha: 0.7),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Divider(
                            color: _textColor.withValues(alpha: 0.15),
                            indent: 60,
                            endIndent: 60,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Excerpt with Drop Cap
                    _buildDropCapText(book.excerptText),

                    const SizedBox(height: 24),

                    // Extended Classical Chapters for Full Immersion
                    Text(
                      'Pikiran kita akan diwarnai oleh corak pemikiran yang sering kita biasakan; sebab jiwa diresapi oleh impresi-impresi batin. Celupkanlah jiwamu ke dalam rangkaian renungan semacam ini: di mana seseorang dapat hidup, di situ ia juga dapat hidup dengan luhur.',
                      style: GoogleFonts.ebGaramond(
                        fontSize: _fontSize,
                        color: _textColor,
                        height: 1.65,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Jangan bertindak seolah-olah kamu akan hidup sepuluh ribu tahun lagi. Kematian menggantung di atasmu setiap saat. Selagi kamu masih hidup, selagi itu berada dalam kuasamu, jadilah orang yang bajik dan luhur budi pekertinya.',
                      style: GoogleFonts.ebGaramond(
                        fontSize: _fontSize,
                        color: _textColor,
                        height: 1.65,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Segala sesuatu terjadi sesuai dengan Kodrat Semesta; dan apa yang baik bagi keseluruhan tidak pernah merugikan bagian-bagiannya. Terimalah takdir yang ditenun untukmu tanpa keluh kesah, sebab itulah tenunan hidup yang memang diperuntukkan bagimu.',
                      style: GoogleFonts.ebGaramond(
                        fontSize: _fontSize,
                        color: _textColor,
                        height: 1.65,
                      ),
                    ),
                    const SizedBox(height: 36),

                    // End of chapter ornament
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_florist_outlined,
                            color: _accentColor.withValues(alpha: 0.5),
                            size: 28,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Akhir Bagian Pertama',
                            style: GoogleFonts.ebGaramond(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: _textColor.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropCapText(String fullText) {
    if (fullText.isEmpty) return const SizedBox.shrink();
    final firstChar = fullText.substring(0, 1);
    final rest = fullText.substring(1);

    return RichText(
      text: TextSpan(
        style: GoogleFonts.ebGaramond(
          fontSize: _fontSize,
          color: _textColor,
          height: 1.65,
        ),
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: Padding(
              padding: const EdgeInsets.only(right: 6, top: 4),
              child: Text(
                firstChar,
                style: GoogleFonts.ebGaramond(
                  fontSize: _fontSize * 2.5,
                  fontWeight: FontWeight.bold,
                  color: _accentColor,
                  height: 0.85,
                ),
              ),
            ),
          ),
          TextSpan(text: rest),
        ],
      ),
    );
  }

  void _showTypographySheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: _bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setSheetState) {
            return Container(
              padding: const EdgeInsets.all(22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pengaturan Membaca',
                    style: GoogleFonts.ebGaramond(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Font Size
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ukuran Teks',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: _textColor,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            color: _textColor,
                            onPressed: _fontSize > 13
                                ? () {
                                    setState(() => _fontSize -= 1.5);
                                    setSheetState(() {});
                                  }
                                : null,
                          ),
                          Text(
                            '${_fontSize.toInt()} pt',
                            style: GoogleFonts.manrope(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: _textColor,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            color: _textColor,
                            onPressed: _fontSize < 26
                                ? () {
                                    setState(() => _fontSize += 1.5);
                                    setSheetState(() {});
                                  }
                                : null,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Theme Selector
                  Text(
                    'Tema Kertas',
                    style: GoogleFonts.manrope(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: _textColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildThemeOption(
                        label: 'Linen',
                        theme: ReaderTheme.linen,
                        bg: const Color(0xFFFAF5EE),
                        fg: const Color(0xFF3A302A),
                        setSheetState: setSheetState,
                      ),
                      const SizedBox(width: 10),
                      _buildThemeOption(
                        label: 'Sepia',
                        theme: ReaderTheme.sepia,
                        bg: const Color(0xFFF4ECD8),
                        fg: const Color(0xFF433422),
                        setSheetState: setSheetState,
                      ),
                      const SizedBox(width: 10),
                      _buildThemeOption(
                        label: 'Sanctum Gelap',
                        theme: ReaderTheme.dark,
                        bg: const Color(0xFF1E1713),
                        fg: const Color(0xFFECE6DC),
                        setSheetState: setSheetState,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildThemeOption({
    required String label,
    required ReaderTheme theme,
    required Color bg,
    required Color fg,
    required StateSetter setSheetState,
  }) {
    final isSelected = _theme == theme;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => _theme = theme);
          setSheetState(() {});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? _accentColor : const Color(0x33D8D0C8),
              width: isSelected ? 2 : 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: fg,
            ),
          ),
        ),
      ),
    );
  }
}
