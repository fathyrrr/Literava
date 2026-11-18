import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/book.dart';
import '../../../providers/library_provider.dart';
import '../../../widgets/book_cover_image.dart';
import '../../../widgets/custom_toast.dart';

class BookInspectCard extends StatelessWidget {
  final Book book;

  const BookInspectCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();
    final isBookmarked = provider.isBookmarked(book.id);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x33D8D0C8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x123A302A),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Archival Stamp Watermark in bottom right
          Positioned(
            right: -20,
            bottom: -20,
            child: Opacity(
              opacity: 0.08,
              child: Transform.rotate(
                angle: 0.2,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 4,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'LITERAVA\nARCHIVE\nVERITAS',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ebGaramond(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cover Image with Badge
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 82,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerHigh,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1F000000),
                                  blurRadius: 8,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                            child: BookCoverImage(
                              imageUrl: book.coverImageUrl,
                              fit: BoxFit.cover,
                              fallbackColor: Color(book.spineColor1),
                              fallbackChild: Center(
                                child: Icon(
                                  Icons.auto_stories,
                                  color: Color(book.ribbonColor),
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 6,
                          left: 6,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.65),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              book.category.split(' ').first,
                              style: GoogleFonts.manrope(
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFDE68A),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),

                    // Book Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${book.rating}',
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                ' • ${book.pages} Halaman',
                                style: GoogleFonts.manrope(
                                  fontSize: 11,
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            book.title,
                            style: GoogleFonts.ebGaramond(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onSurface,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            book.author,
                            style: GoogleFonts.manrope(
                              fontSize: 11.5,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            book.description,
                            style: GoogleFonts.manrope(
                              fontSize: 11,
                              color: AppColors.secondary,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ).build(
                        context,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 48,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color: isBookmarked
                              ? AppColors.primary
                              : AppColors.onSurface,
                          size: 20,
                        ),
                        onPressed: () {
                          provider.toggleBookmark(book.id);
                          CustomToast.show(
                            context,
                            message: isBookmarked
                                ? 'Dihapus dari tanda rak tersimpan'
                                : 'Ditambahkan ke tanda rak tersimpan',
                            icon: isBookmarked
                                ? Icons.bookmark_border
                                : Icons.bookmark,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension on ButtonStyle {
  Widget build(BuildContext context) {
    final provider = context.read<LibraryProvider>();
    final book = provider.activeBook;

    return ElevatedButton(
      style: this,
      onPressed: () {
        provider.selectBook(book, navigateToDesk: true);
        CustomToast.show(
          context,
          message: 'Membawa ${book.title} ke Meja Baca',
          icon: Icons.menu_book,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.menu_book, size: 18),
          const SizedBox(width: 8),
          Text(
            'Ambil & Bawa ke Meja Baca',
            style: GoogleFonts.manrope(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
