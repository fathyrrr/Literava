import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/book.dart';
import 'book_spine.dart';

class WoodenShelfWidget extends StatelessWidget {
  final String title;
  final Color accentColor;
  final List<Book> books;
  final String activeBookId;
  final Function(Book) onBookSelected;

  const WoodenShelfWidget({
    super.key,
    required this.title,
    required this.accentColor,
    required this.books,
    required this.activeBookId,
    required this.onBookSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x33D8D0C8)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x083A302A),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shelf Tier Header Label
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 5,
                      height: 16,
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.ebGaramond(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${books.length} Naskah',
                  style: GoogleFonts.manrope(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Horizontal Shelf with Books
          SizedBox(
            height: 250, // Accommodates spines (up to 220px) + pull animation (22px) + ribbon (20px)
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(top: 24, bottom: 6, left: 6, right: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: books.map((book) {
                  final isActive = book.id == activeBookId;
                  return BookSpineWidget(
                    book: book,
                    isActive: isActive,
                    onTap: () => onBookSelected(book),
                  );
                }).toList(),
              ),
            ),
          ),

          // BALOK KAYU RAK FISIK (Solid Mahogany Shelf Construction)
          Container(
            height: 16,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF6E432A),
                  Color(0xFF492B1A),
                ],
              ),
              borderRadius: BorderRadius.circular(3),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 48,
                    height: 2,
                    decoration: BoxDecoration(
                      color: const Color(0x44FDE68A),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  Container(
                    width: 64,
                    height: 2,
                    decoration: BoxDecoration(
                      color: const Color(0x44000000),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 2,
                    decoration: BoxDecoration(
                      color: const Color(0x44FDE68A),
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bayangan di Bawah Rak
          Container(
            height: 6,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x28000000),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
