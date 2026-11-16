import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/library_provider.dart';
import '../../services/library_service.dart';
import 'widgets/wooden_shelf.dart';
import 'widgets/book_inspect_card.dart';
import 'widgets/book_grid_card.dart';

class LorongRakScreen extends StatelessWidget {
  const LorongRakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();
    final lane = provider.currentLane;
    final activeBook = provider.activeBook;

    final tier1Books = LibraryService.getBooksByTier(1);
    final tier2Books = LibraryService.getBooksByTier(2);
    final allShelfBooks = LibraryService.books;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Plakat Kuningan Navigasi Lorong
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0x33D8D0C8)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x063A302A),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            lane.wingLocation.toUpperCase(),
                            style: GoogleFonts.manrope(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'Lorong ${lane.roman}: ${lane.name}',
                        style: GoogleFonts.ebGaramond(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.onSurface,
                          height: 1.15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${lane.shelfNumber} • 38 Manuskrip Tersedia',
                        style: GoogleFonts.manrope(
                          fontSize: 11,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),

                // View Mode Toggle (Spine View vs Grid View)
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      _buildToggleButton(
                        icon: Icons.view_column_rounded,
                        tooltip: 'Tampilan Punggung Rak',
                        isActive: provider.isSpineView,
                        onTap: () => provider.toggleSpineView(true),
                      ),
                      _buildToggleButton(
                        icon: Icons.grid_view_rounded,
                        tooltip: 'Katalog Kartu',
                        isActive: !provider.isSpineView,
                        onTap: () => provider.toggleSpineView(false),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // 2. Indikator Suasana Perpustakaan Nyata
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Sentuh punggung buku untuk mencabut dari rak',
                      style: GoogleFonts.ebGaramond(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
                Text(
                  lane.deweyRange,
                  style: GoogleFonts.manrope(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                    color: AppColors.outline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // 3. TAMPILAN RAK / KATALOG
          if (provider.isSpineView) ...[
            // TINGKAT 1
            WoodenShelfWidget(
              title: 'Tingkat Atas: Naskah Stoikisme & Etika Romawi',
              accentColor: AppColors.primary,
              books: tier1Books,
              activeBookId: activeBook.id,
              onBookSelected: (book) {
                provider.selectBook(book);
              },
            ),
            const SizedBox(height: 16),

            // TINGKAT 2
            WoodenShelfWidget(
              title: 'Tingkat Tengah: Diskursus Eksistensialisme',
              accentColor: AppColors.tertiary,
              books: tier2Books,
              activeBookId: activeBook.id,
              onBookSelected: (book) {
                provider.selectBook(book);
              },
            ),
          ] else ...[
            // Tampilan Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemCount: allShelfBooks.length,
              itemBuilder: (ctx, index) {
                final book = allShelfBooks[index];
                return BookGridCard(
                  book: book,
                  isSelected: book.id == activeBook.id,
                  onTap: () => provider.selectBook(book),
                );
              },
            ),
          ],
          const SizedBox(height: 20),

          // 4. KARTU PREVIEW BUKU AKTIF (Tactile Reader Desk Callout)
          BookInspectCard(book: activeBook),
          const SizedBox(height: 20),

          // 5. Classic Footnote Quote
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '“Buku adalah pelabuhan hening di mana pikiran-pikiran agung masa lalu terus berlabuh.”',
                textAlign: TextAlign.center,
                style: GoogleFonts.ebGaramond(
                  fontSize: 13.5,
                  fontStyle: FontStyle.italic,
                  color: AppColors.secondary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required IconData icon,
    required String tooltip,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isActive ? AppColors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isActive
                ? const [
                    BoxShadow(
                      color: Color(0x12000000),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          child: Icon(
            icon,
            size: 18,
            color: isActive ? AppColors.primary : AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
