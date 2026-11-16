import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_colors.dart';
import '../../providers/library_provider.dart';
import '../../widgets/custom_toast.dart';
import 'widgets/ambient_badge.dart';
import 'widgets/library_card_slip.dart';
import 'widgets/epigraph_card.dart';
import 'widgets/discovery_bento.dart';

class LobiScreen extends StatelessWidget {
  const LobiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Ambient Badge
          const AmbientBadge(),
          const SizedBox(height: 22),

          // 2. Warm Welcoming Editorial Statement
          Row(
            children: [
              const Icon(
                Icons.villa_outlined,
                size: 19,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'FOYER UTAMA',
                style: GoogleFonts.manrope(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: GoogleFonts.ebGaramond(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
                height: 1.15,
                letterSpacing: -0.4,
              ),
              children: [
                const TextSpan(text: 'Selamat Datang di\n'),
                TextSpan(
                  text: 'Literava Sanctum',
                  style: GoogleFonts.ebGaramond(
                    fontStyle: FontStyle.italic,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Sebuah suaka literatur yang hening. Silakan melangkah masuk, hirup aroma kertas linen, dan temukan naskah yang memanggil jiwamu hari ini.',
            style: GoogleFonts.manrope(
              fontSize: 13.5,
              fontWeight: FontWeight.w300,
              color: AppColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 22),

          // 3. Heritage Virtual Library Card
          const LibraryCardSlip(),
          const SizedBox(height: 18),

          // 4. Primary CTA Action Button
          Material(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(14),
            elevation: 3,
            shadowColor: AppColors.primary.withValues(alpha: 0.3),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                provider.setNavIndex(2); // Jump to Lorong Rak
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.menu_book,
                            color: AppColors.onPrimary,
                            size: 22,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Mulai Menjelajah Lorong Buku',
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.onPrimary,
                                letterSpacing: 0.3,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.onPrimary,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),

          // 5. Curator Epigraph
          const EpigraphCard(),
          const SizedBox(height: 24),

          // 6. Discovery Bento
          const DiscoveryBento(),
          const SizedBox(height: 22),

          // 7. Quiet Protocol Card
          GestureDetector(
            onTap: () {
              provider.toggleQuietMode();
              CustomToast.show(
                context,
                message: provider.isQuietMode
                    ? 'Protokol Kebungkaman Suaka Aktif (Mode Hening Penuh)'
                    : 'Pemberitahuan normal diaktifkan',
                icon: provider.isQuietMode ? Icons.volume_off : Icons.volume_up,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0x33D8D0C8)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    provider.isQuietMode ? Icons.volume_off : Icons.volume_up,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Protokol Kebungkaman Suaka',
                              style: GoogleFonts.ebGaramond(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface,
                              ),
                            ),
                            Text(
                              provider.isQuietMode ? 'HENING' : 'NORMAL',
                              style: GoogleFonts.manrope(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: provider.isQuietMode
                                    ? AppColors.primary
                                    : AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Pemberitahuan hening diaktifkan secara otomatis demi menjaga kekhidmatan telaah literatur Anda.',
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            color: AppColors.onSurfaceVariant,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
