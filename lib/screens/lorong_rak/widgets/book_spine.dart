import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/book.dart';

class BookSpineWidget extends StatelessWidget {
  final Book book;
  final bool isActive;
  final VoidCallback onTap;

  const BookSpineWidget({
    super.key,
    required this.book,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        margin: EdgeInsets.only(
          bottom: isActive ? 22 : 0,
          left: 4,
          right: 4,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            // 1. Hanging Ribbon Bookmark underneath
            Positioned(
              bottom: isActive ? -22 : -14,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 7,
                height: isActive ? 26 : 18,
                decoration: BoxDecoration(
                  color: Color(book.ribbonColor),
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(3)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),

            // 2. Main Book Spine Body
            Container(
              width: book.spineWidth,
              height: book.spineHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(book.spineColor1),
                    Color(book.spineColor2),
                  ],
                ),
                borderRadius: BorderRadius.circular(3),
                border: isActive
                    ? Border.all(color: AppColors.primary, width: 2)
                    : null,
                boxShadow: [
                  BoxShadow(
                    color: isActive
                        ? AppColors.primary.withValues(alpha: 0.35)
                        : const Color(0x33000000),
                    blurRadius: isActive ? 12 : 6,
                    offset: Offset(isActive ? 0 : 2, isActive ? -4 : 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top Gold Gilt Accent
                  Column(
                    children: [
                      Container(
                        height: 3,
                        margin: const EdgeInsets.only(top: 4, left: 3, right: 3),
                        color: const Color(0x66FDE68A),
                      ),
                      if (isActive)
                        const Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Icon(
                            Icons.flare,
                            size: 13,
                            color: Color(0xFFFDE68A),
                          ),
                        ),
                    ],
                  ),

                  // Center Vertical Title (Rotated 90 degrees)
                  Expanded(
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: 3, // Rotates vertically
                        child: Text(
                          '${book.title} — ${book.author.split('(').first.trim()}',
                          style: GoogleFonts.ebGaramond(
                            fontSize: book.spineWidth > 50 ? 12 : 11,
                            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                            letterSpacing: 0.8,
                            color: isActive
                                ? AppColors.primaryFixed
                                : const Color(0xDDFEF3C7),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),

                  // Bottom Call Number
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      book.deweyCode,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w600,
                        color: isActive
                            ? AppColors.primaryFixed
                            : const Color(0x88FEF3C7),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3. "AKTIF" Pull Badge (When Book is Pulled)
            if (isActive)
              Positioned(
                top: -12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    'AKTIF',
                    style: GoogleFonts.manrope(
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.8,
                      color: AppColors.onPrimary,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
