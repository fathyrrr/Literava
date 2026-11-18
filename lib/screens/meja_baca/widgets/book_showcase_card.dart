import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/book.dart';
import '../../../providers/library_provider.dart';
import '../../../widgets/book_cover_image.dart';
import '../../../widgets/custom_toast.dart';
import '../dialogs/notes_dialog.dart';
import 'dust_motes_overlay.dart';

class BookShowcaseCard extends StatelessWidget {
  final Book book;

  const BookShowcaseCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();
    final isBookmarked = provider.isBookmarked(book.id);
    final isLampOn = provider.isLampActive;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0x33D8D0C8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0E3A302A),
            blurRadius: 18,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Column(
          children: [
            // Ambient desk glow container with dust motes
            Stack(
              children: [
                Positioned.fill(
                  child: DustMotesOverlay(isLampOn: isLampOn),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        isLampOn
                            ? AppColors.primary.withValues(alpha: 0.12)
                            : Colors.transparent,
                        AppColors.surfaceContainerLow.withValues(alpha: 0.4),
                        AppColors.surfaceContainerLowest,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Column(
                    children: [
                  // Call Number Tag
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.sell_outlined,
                            size: 13,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            book.callNumber,
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Big Book Display Image with Warm Ambiance
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: 270,
                            height: 190,
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerHigh,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x28000000),
                                  blurRadius: 14,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: BookCoverImage(
                              imageUrl: book.coverImageUrl,
                              fit: BoxFit.cover,
                              fallbackColor: const Color(0xFF6E432A),
                              fallbackChild: const Center(
                                child: Icon(
                                  Icons.menu_book,
                                  size: 64,
                                  color: Color(0xFFFDE68A),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Golden bookmark ribbon overlay
                        Positioned(
                          top: -2,
                          child: Container(
                            width: 14,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Color(book.ribbonColor),
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(3),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x33000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: 5,
                                height: 5,
                                margin: const EdgeInsets.only(bottom: 3),
                                decoration: const BoxDecoration(
                                  color: Colors.white60,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Ambient shadow blur underneath
                  Container(
                    width: 200,
                    height: 8,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Meta Pills
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildPill('Koleksi Utama', isAccent: true),
                      _buildPill('Klasik ${book.year}'),
                      _buildPill('${book.pages} Hlm'),
                      _buildPill('Bahasa Indonesia & Latin'),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Title & Author
                  Text(
                    book.title.split('(').first.trim(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ebGaramond(
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                      height: 1.15,
                    ),
                  ),
                  if (book.title.contains('(')) ...[
                    const SizedBox(height: 2),
                    Text(
                      '(${book.title.split('(').last}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ebGaramond(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                  const SizedBox(height: 6),
                  Text(
                    book.author.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

            // Quick Desk Micro-Actions
            Container(
              color: AppColors.surfaceContainerLow,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Action 1: Tandai Rak
                  _buildMicroAction(
                    icon: isBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
                    label: isBookmarked ? 'Ditandai' : 'Tandai Rak',
                    isActive: isBookmarked,
                    onTap: () {
                      provider.toggleBookmark(book.id);
                      CustomToast.show(
                        context,
                        message: isBookmarked
                            ? 'Dihapus dari tanda Meja Baca'
                            : 'Tersimpan di Meja Baca Pribadi Anda',
                        icon: isBookmarked ? Icons.bookmark_border : Icons.bookmark,
                      );
                    },
                  ),
                  Container(width: 1, height: 28, color: AppColors.outlineVariant),

                  // Action 2: Catat Kutipan
                  _buildMicroAction(
                    icon: Icons.edit_note,
                    label: 'Catat Kutipan',
                    isActive: false,
                    onTap: () {
                      NotesSheet.show(context, book);
                    },
                  ),
                  Container(width: 1, height: 28, color: AppColors.outlineVariant),

                  // Action 3: Audio Hening
                  _buildMicroAction(
                    icon: provider.isPlayingAmbientAudio
                        ? Icons.graphic_eq
                        : Icons.headphones_outlined,
                    label: provider.isPlayingAmbientAudio ? 'Memutar' : 'Audio Hening',
                    isActive: provider.isPlayingAmbientAudio,
                    onTap: () {
                      provider.toggleAmbientAudio();
                      CustomToast.show(
                        context,
                        message: provider.isPlayingAmbientAudio
                            ? 'Memutar Narasi Audio Suara Alam & Klasika...'
                            : 'Audio Hening dimatikan',
                        icon: Icons.headphones,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPill(String text, {bool isAccent = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: isAccent
            ? AppColors.primary.withValues(alpha: 0.12)
            : AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          fontSize: 10.5,
          fontWeight: isAccent ? FontWeight.w700 : FontWeight.w500,
          color: isAccent ? AppColors.primary : AppColors.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildMicroAction({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          children: [
            Icon(
              icon,
              size: 20,
              color: isActive ? AppColors.primary : AppColors.onSurfaceVariant,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? AppColors.primary : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
