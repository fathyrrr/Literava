import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../providers/library_provider.dart';
import '../../../widgets/custom_toast.dart';

class BankersLampHeader extends StatelessWidget {
  const BankersLampHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();
    final isLampOn = provider.isLampActive;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x33D8D0C8)),
        boxShadow: [
          BoxShadow(
            color: isLampOn
                ? const Color(0x18F59E0B)
                : const Color(0x063A302A),
            blurRadius: isLampOn ? 16 : 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.desk,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: isLampOn
                              ? const Color(0xFF10B981)
                              : AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'MEJA BACA NO. 12',
                        style: GoogleFonts.manrope(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 1),
                  Text(
                    isLampOn
                        ? 'Penerangan Kuningan Aktif • Suasana Teduh'
                        : 'Penerangan Temaram • Mode Hening',
                    style: GoogleFonts.manrope(
                      fontSize: 11,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Banker's Lamp Switch
          GestureDetector(
            onTap: () {
              provider.toggleLamp();
              CustomToast.show(
                context,
                message: provider.isLampActive
                    ? 'Penerangan Kuningan Meja 12 dinyalakan (Warm Aura)'
                    : 'Penerangan Meja dipadamkan ke mode hening temaram',
                icon: provider.isLampActive
                    ? Icons.lightbulb
                    : Icons.nightlight_round,
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: isLampOn
                    ? const Color(0xFFFEF3C7)
                    : AppColors.surfaceContainerHigh,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isLampOn
                      ? const Color(0xFFF59E0B)
                      : AppColors.outlineVariant,
                  width: 1.5,
                ),
                boxShadow: isLampOn
                    ? [
                        BoxShadow(
                          color: const Color(0xFFF59E0B).withValues(alpha: 0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Icon(
                isLampOn ? Icons.lightbulb : Icons.lightbulb_outline,
                size: 20,
                color: isLampOn
                    ? const Color(0xFFD97706)
                    : AppColors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
