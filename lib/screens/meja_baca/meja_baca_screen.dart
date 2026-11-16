import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/library_provider.dart';
import 'widgets/bankers_lamp_glow.dart';
import 'widgets/book_showcase_card.dart';
import 'widgets/desk_actions_bar.dart';
import 'widgets/chapter_preview_card.dart';
import 'widgets/specs_bento.dart';

class MejaBacaScreen extends StatelessWidget {
  const MejaBacaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();
    final book = provider.activeBook;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Desk Station Header with Banker's Lamp Switch
          const BankersLampHeader(),
          const SizedBox(height: 14),

          // 2. Book Showcase Card on Desk
          BookShowcaseCard(book: book),
          const SizedBox(height: 18),

          // 3. Dual Primary CTAs (Baca di Tempat & Unduh PDF)
          DeskActionsBar(book: book),
          const SizedBox(height: 20),

          // 4. Catatan Kurasi Pustakawan
          Container(
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0x33D8D0C8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.history_edu,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Catatan Kurasi Pustakawan',
                            style: GoogleFonts.ebGaramond(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        book.curatorNotes,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: AppColors.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                // Certified Footer
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh.withValues(alpha: 0.5),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Kurator: Dr. H. Adrianus • Bagian Manuskrip Klasik',
                          style: GoogleFonts.ebGaramond(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: AppColors.onSurfaceVariant,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Tersertifikasi',
                        style: GoogleFonts.manrope(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 5. Pratinjau Bab Pertama
          ChapterPreviewCard(book: book),
          const SizedBox(height: 22),

          // 6. Spesifikasi Arsip Fisik & Digital Bento Grid
          SpecsBentoGrid(book: book),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
