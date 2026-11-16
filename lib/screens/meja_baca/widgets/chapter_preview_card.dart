import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/book.dart';
import '../../reader/reader_screen.dart';

class ChapterPreviewCard extends StatelessWidget {
  final Book book;

  const ChapterPreviewCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final firstChar = book.excerptText.isNotEmpty
        ? book.excerptText.substring(0, 1)
        : 'M';
    final restOfFirstPara = book.excerptText.isNotEmpty
        ? book.excerptText.substring(1).split('\n\n').first
        : '';
    final secondPara = book.excerptText.contains('\n\n')
        ? book.excerptText.split('\n\n')[1]
        : '';

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.menu_book, size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  'Pratinjau Bab Pertama',
                  style: GoogleFonts.ebGaramond(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
            Text(
              'HALAMAN 1 DARI ${book.pages}',
              style: GoogleFonts.manrope(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                color: AppColors.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Paper Texture Card
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0x33D8D0C8)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A3A302A),
                blurRadius: 14,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Shield Watermark Pattern in background
              Positioned(
                right: 12,
                top: 12,
                child: Opacity(
                  opacity: 0.05,
                  child: const Icon(
                    Icons.shield_outlined,
                    size: 90,
                    color: AppColors.onSurface,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.excerptBook.toUpperCase(),
                      style: GoogleFonts.manrope(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      book.excerptTitle,
                      style: GoogleFonts.ebGaramond(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Excerpt with Drop Cap
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.ebGaramond(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: AppColors.onSurface,
                          height: 1.5,
                        ),
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.top,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4, top: 2),
                              child: Text(
                                firstChar,
                                style: GoogleFonts.ebGaramond(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                  height: 0.85,
                                ),
                              ),
                            ),
                          ),
                          TextSpan(text: restOfFirstPara),
                        ],
                      ),
                    ),
                    if (secondPara.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(
                        secondPara,
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: AppColors.onSurfaceVariant,
                          height: 1.5,
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),

                    // Bottom info & Expand action
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.local_cafe_outlined,
                              size: 14,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Waktu baca: ~3 mnt',
                              style: GoogleFonts.manrope(
                                fontSize: 10.5,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            ReaderScreen.open(context, book);
                          },
                          child: Row(
                            children: [
                              Text(
                                'Buka Selengkapnya',
                                style: GoogleFonts.manrope(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(width: 2),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                size: 16,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
