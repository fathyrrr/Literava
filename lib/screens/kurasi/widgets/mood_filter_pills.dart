import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../providers/library_provider.dart';

class MoodFilterPills extends StatelessWidget {
  const MoodFilterPills({super.key});

  static const List<Map<String, String>> moods = [
    {'id': 'all', 'label': 'Semua Suasana'},
    {'id': 'reflective', 'label': 'Reflektif & Sunyi'},
    {'id': 'philosophy', 'label': 'Petualangan Filosofis'},
    {'id': 'nostalgia', 'label': 'Nostalgia Klasik'},
    {'id': 'science', 'label': 'Sains & Semesta'},
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SUASANA BACAAN',
          style: GoogleFonts.manrope(
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
            color: AppColors.secondary,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 38,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: moods.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (ctx, index) {
              final mood = moods[index];
              final isSelected = provider.selectedMood == mood['id'];

              return GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                  provider.selectMood(mood['id']!);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.25),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    mood['label']!,
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected
                          ? AppColors.onPrimary
                          : AppColors.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
