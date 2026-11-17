import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../models/book.dart';
import '../../models/book_chapter.dart';
import '../../models/book_highlight.dart';
import '../../providers/library_provider.dart';
import '../../widgets/custom_toast.dart';
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
  int _currentChapterIndex = 0;

  List<BookChapter> get _chapters => widget.book.effectiveChapters;
  BookChapter get _currentChapter => _chapters[_currentChapterIndex];

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

  void _goToChapter(int index) {
    if (index < 0 || index >= _chapters.length) return;
    HapticFeedback.lightImpact();
    setState(() {
      _currentChapterIndex = index;
      _progress = 0.0;
    });
    if (_scrollCtrl.hasClients) {
      _scrollCtrl.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    final provider = context.watch<LibraryProvider>();
    final bookHighlights = provider.getHighlightsForBook(book.id);

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Reader Navigation & Action Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
                          '${(_progress * 100).toInt()}% • ${_currentChapter.chapterNumber} (${_currentChapterIndex + 1}/${_chapters.length})',
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Table of Contents Drawer Button
                      IconButton(
                        tooltip: 'Daftar Isi Bab',
                        icon: Icon(Icons.format_list_bulleted, size: 20, color: _textColor),
                        onPressed: _showTableOfContents,
                      ),
                      // Highlights Drawer Button
                      Stack(
                        children: [
                          IconButton(
                            tooltip: 'Kutipan & Stabilo',
                            icon: Icon(Icons.draw_outlined, size: 20, color: _textColor),
                            onPressed: () => _showHighlightsSheet(bookHighlights),
                          ),
                          if (bookHighlights.isNotEmpty)
                            Positioned(
                              right: 6,
                              top: 6,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '${bookHighlights.length}',
                                  style: const TextStyle(
                                    fontSize: 9,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      // Typography sheet
                      IconButton(
                        tooltip: 'Pengaturan Teks & Tema',
                        icon: Icon(Icons.format_size, size: 20, color: _textColor),
                        onPressed: _showTypographySheet,
                      ),
                      // Quick note
                      IconButton(
                        tooltip: 'Catatan Marginalia',
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
                              horizontal: 14,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: _accentColor.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _currentChapter.chapterNumber.toUpperCase(),
                              style: GoogleFonts.manrope(
                                fontSize: 10.5,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                                color: _accentColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _currentChapter.title,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ebGaramond(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: _textColor,
                              height: 1.2,
                            ),
                          ),
                          if (_currentChapter.subtitle.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Text(
                              _currentChapter.subtitle,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: _textColor.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                          const SizedBox(height: 6),
                          Text(
                            '${book.author} • ± ${_currentChapter.estimatedMinutes} menit baca',
                            style: GoogleFonts.manrope(
                              fontSize: 11,
                              color: _textColor.withValues(alpha: 0.6),
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

                    // Chapter Content with Drop Cap
                    _buildDropCapText(_currentChapter.content),

                    const SizedBox(height: 32),

                    // Vintage Highlight Passage Creator Bar
                    _buildHighlightCreatorCard(context, provider),

                    const SizedBox(height: 36),

                    // End of chapter ornament
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_florist_outlined,
                            color: _accentColor.withValues(alpha: 0.5),
                            size: 26,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Akhir ${_currentChapter.chapterNumber}',
                            style: GoogleFonts.ebGaramond(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: _textColor.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Chapter Pagination Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Previous
                        if (_currentChapterIndex > 0)
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: _textColor,
                              side: BorderSide(color: _textColor.withValues(alpha: 0.3)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            icon: const Icon(Icons.chevron_left, size: 18),
                            label: Text(
                              'Bab Sebelumnya',
                              style: GoogleFonts.manrope(fontSize: 11),
                            ),
                            onPressed: () => _goToChapter(_currentChapterIndex - 1),
                          )
                        else
                          const SizedBox.shrink(),

                        // Next
                        if (_currentChapterIndex < _chapters.length - 1)
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _accentColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            iconAlignment: IconAlignment.end,
                            label: Text(
                              'Bab Berikutnya',
                              style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                            icon: const Icon(Icons.chevron_right, size: 18),
                            onPressed: () => _goToChapter(_currentChapterIndex + 1),
                          )
                        else
                          Text(
                            'Tamat Naskah',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: _textColor.withValues(alpha: 0.5),
                            ),
                          ),
                      ],
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

  // Drop Cap formatting for the chapter opening
  Widget _buildDropCapText(String text) {
    if (text.isEmpty) return const SizedBox.shrink();

    final firstLetter = text[0];
    final remainingText = text.substring(1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 12, bottom: 4),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: _accentColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _accentColor.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Text(
                firstLetter,
                style: GoogleFonts.ebGaramond(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: _accentColor,
                  height: 1.05,
                ),
              ),
            ),
            Expanded(
              child: Text(
                remainingText.split('\n\n').first,
                style: GoogleFonts.ebGaramond(
                  fontSize: _fontSize,
                  color: _textColor,
                  height: 1.68,
                ),
              ),
            ),
          ],
        ),
        // Subsequent paragraphs
        if (text.contains('\n\n')) ...[
          const SizedBox(height: 16),
          for (final para in text.split('\n\n').skip(1)) ...[
            Text(
              para,
              style: GoogleFonts.ebGaramond(
                fontSize: _fontSize,
                color: _textColor,
                height: 1.68,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ],
      ],
    );
  }

  // Vintage Highlight Creator Card
  Widget _buildHighlightCreatorCard(BuildContext context, LibraryProvider provider) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _theme == ReaderTheme.dark
            ? Colors.white.withValues(alpha: 0.05)
            : const Color(0x0C3A302A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _textColor.withValues(alpha: 0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.edit_note, size: 18, color: _accentColor),
              const SizedBox(width: 8),
              Text(
                'STABILO & KUTIPAN KATA MUTIARA',
                style: GoogleFonts.manrope(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  color: _accentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Tandai kalimat yang menyentuh jiwamu dari bab ini dan simpan ke buku catatan Marginalia pribadimu.',
            style: GoogleFonts.manrope(
              fontSize: 11.5,
              color: _textColor.withValues(alpha: 0.75),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildVintageColorButton(
                label: 'Emas Kuno',
                color: const Color(0xFFD97706),
                onTap: () => _promptAddHighlight(context, provider, 0xFFD97706),
              ),
              _buildVintageColorButton(
                label: 'Terakota Sahara',
                color: const Color(0xFFC2652A),
                onTap: () => _promptAddHighlight(context, provider, 0xFFC2652A),
              ),
              _buildVintageColorButton(
                label: 'Sage Hijau',
                color: const Color(0xFF059669),
                onTap: () => _promptAddHighlight(context, provider, 0xFF059669),
              ),
              _buildVintageColorButton(
                label: 'Mawar Klasik',
                color: const Color(0xFF8C3C3C),
                onTap: () => _promptAddHighlight(context, provider, 0xFF8C3C3C),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVintageColorButton({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 9,
              height: 9,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _promptAddHighlight(BuildContext context, LibraryProvider provider, int colorHex) {
    HapticFeedback.lightImpact();
    final textCtrl = TextEditingController(
      text: '${_currentChapter.content.split('. ').take(2).join('. ')}.',
    );
    final noteCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surfaceContainerLowest,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        title: Text(
          'Simpan Kutipan Berstabilo',
          style: GoogleFonts.ebGaramond(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Teks Kalimat yang Ditandai:',
              style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: textCtrl,
              maxLines: 3,
              style: GoogleFonts.manrope(fontSize: 12),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(colorHex).withValues(alpha: 0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(colorHex)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Refleksi Pribadi (Opsional):',
              style: GoogleFonts.manrope(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.onSurfaceVariant),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: noteCtrl,
              maxLines: 2,
              style: GoogleFonts.manrope(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Tuliskan hikmah atau pemikiranmu...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(colorHex), foregroundColor: Colors.white),
            onPressed: () {
              if (textCtrl.text.trim().isNotEmpty) {
                provider.addHighlight(
                  bookId: widget.book.id,
                  chapterId: _currentChapter.id,
                  text: textCtrl.text.trim(),
                  note: noteCtrl.text.trim(),
                  colorHex: colorHex,
                  bookTitle: widget.book.title,
                  pageNumber: _currentChapterIndex + 1,
                );
                Navigator.pop(ctx);
                CustomToast.show(
                  context,
                  message: 'Kutipan berstabilo tersimpan ke Marginalia!',
                  icon: Icons.bookmark_added,
                );
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  // Table of Contents Sheet
  void _showTableOfContents() {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      backgroundColor: _bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _textColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Daftar Isi Bab',
                style: GoogleFonts.ebGaramond(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _textColor,
                ),
              ),
              Text(
                widget.book.title,
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  color: _textColor.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _chapters.length,
                  separatorBuilder: (_, _) => Divider(color: _textColor.withValues(alpha: 0.1)),
                  itemBuilder: (c, idx) {
                    final ch = _chapters[idx];
                    final isCurrent = idx == _currentChapterIndex;
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: isCurrent ? _accentColor : _accentColor.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${idx + 1}',
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isCurrent ? Colors.white : _accentColor,
                          ),
                        ),
                      ),
                      title: Text(
                        ch.chapterNumber,
                        style: GoogleFonts.manrope(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: isCurrent ? _accentColor : _textColor.withValues(alpha: 0.6),
                        ),
                      ),
                      subtitle: Text(
                        ch.title,
                        style: GoogleFonts.ebGaramond(
                          fontSize: 16,
                          fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                          color: _textColor,
                        ),
                      ),
                      trailing: Text(
                        '± ${ch.estimatedMinutes} mnt',
                        style: GoogleFonts.manrope(
                          fontSize: 11,
                          color: _textColor.withValues(alpha: 0.5),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(ctx);
                        _goToChapter(idx);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Highlights Sheet
  void _showHighlightsSheet(List<BookHighlight> highlights) {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      backgroundColor: _bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _textColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kutipan Berstabilo',
                    style: GoogleFonts.ebGaramond(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                  Text(
                    '${highlights.length} Catatan',
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _accentColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              if (highlights.isEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.edit_note, size: 36, color: _textColor.withValues(alpha: 0.3)),
                        const SizedBox(height: 8),
                        Text(
                          'Belum ada kutipan berstabilo untuk buku ini.',
                          style: GoogleFonts.manrope(fontSize: 12, color: _textColor.withValues(alpha: 0.5)),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Flexible(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: highlights.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (c, idx) {
                      final h = highlights[idx];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(h.colorHex).withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                          border: Border(left: BorderSide(color: Color(h.colorHex), width: 3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '“${h.text}”',
                              style: GoogleFonts.ebGaramond(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                color: _textColor,
                              ),
                            ),
                            if (h.note.isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Text(
                                'Refleksi: ${h.note}',
                                style: GoogleFonts.manrope(
                                  fontSize: 11,
                                  color: _textColor.withValues(alpha: 0.7),
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // Typography Settings Sheet
  void _showTypographySheet() {
    HapticFeedback.lightImpact();
    showModalBottomSheet(
      context: context,
      backgroundColor: _bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: _textColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Pengaturan Membaca',
                    style: GoogleFonts.ebGaramond(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Font size slider
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
                                    HapticFeedback.selectionClick();
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
                                    HapticFeedback.selectionClick();
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
          HapticFeedback.selectionClick();
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
