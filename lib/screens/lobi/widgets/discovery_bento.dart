import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../providers/library_provider.dart';
import '../../../widgets/custom_toast.dart';

class DiscoveryBento extends StatelessWidget {
  const DiscoveryBento({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pilihan Cepat Penjelajah',
              style: GoogleFonts.ebGaramond(
                fontSize: 21,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.read<LibraryProvider>().setNavIndex(1); // Jump to Kurasi
              },
              child: Text(
                'LIHAT SEMUA',
                style: GoogleFonts.manrope(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildBentoItem(
          context,
          icon: Icons.bookmarks_outlined,
          iconBg: AppColors.surfaceContainerHigh,
          iconColor: AppColors.primary,
          title: 'Koleksi Langka Minggu Ini',
          subtitle: '7 manuskrip terpilih abad ke-18',
          onTap: () {
            context.read<LibraryProvider>().selectLane('lane_4', navigateToShelf: true);
            CustomToast.show(
              context,
              message: 'Membuka Koleksi Manuskrip Langka Abad ke-18',
              icon: Icons.auto_stories,
            );
          },
        ),
        const SizedBox(height: 10),
        _buildBentoItem(
          context,
          icon: Icons.history_edu,
          iconBg: AppColors.secondaryContainer,
          iconColor: AppColors.onSecondaryContainer,
          title: 'Ruang Manuskrip Kuno',
          subtitle: 'Transkrip perkamen & sastra klasik',
          onTap: () {
            context.read<LibraryProvider>().selectLane('lane_2', navigateToShelf: true);
            CustomToast.show(
              context,
              message: 'Menuju Lorong II: Transkrip Perkamen Klasik',
              icon: Icons.hourglass_empty,
            );
          },
        ),
        const SizedBox(height: 10),
        _buildBentoItem(
          context,
          icon: Icons.graphic_eq,
          iconBg: AppColors.tertiaryFixed,
          iconColor: AppColors.tertiary,
          title: 'Arsip Audio Hening',
          subtitle: 'Suara gesekan kertas & bisikan puisi',
          onTap: () {
            final provider = context.read<LibraryProvider>();
            provider.toggleAmbientAudio();
            CustomToast.show(
              context,
              message: provider.isPlayingAmbientAudio
                  ? 'Audio Hening: Memutar gesekan kertas perpustakaan'
                  : 'Audio Hening dihentikan',
              icon: Icons.headphones,
            );
          },
        ),
      ],
    );
  }

  Widget _buildBentoItem(
    BuildContext context, {
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0x33D8D0C8)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.ebGaramond(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                size: 20,
                color: AppColors.outline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
