import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/book.dart';
import '../../../widgets/custom_toast.dart';
import '../../reader/reader_screen.dart';

class DeskActionsBar extends StatefulWidget {
  final Book book;

  const DeskActionsBar({super.key, required this.book});

  @override
  State<DeskActionsBar> createState() => _DeskActionsBarState();
}

class _DeskActionsBarState extends State<DeskActionsBar> {
  bool _isDownloading = false;

  void _simulateDownload() async {
    if (_isDownloading) return;
    setState(() => _isDownloading = true);

    CustomToast.show(
      context,
      message: 'Mengunduh Arsip PDF Resmi (${widget.book.pdfSize})...',
      icon: Icons.downloading,
    );

    await Future.delayed(const Duration(milliseconds: 1800));

    if (mounted) {
      setState(() => _isDownloading = false);
      CustomToast.show(
        context,
        message: 'Arsip PDF Berhasil Disimpan: ${widget.book.title}.pdf',
        icon: Icons.check_circle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Column(
      children: [
        // OPTION 1: Baca di Tempat (Reader View)
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22C2652A),
                blurRadius: 14,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Large background watermark icon
              Positioned(
                right: -10,
                bottom: -15,
                child: Opacity(
                  opacity: 0.12,
                  child: const Icon(
                    Icons.menu_book,
                    size: 110,
                    color: Colors.white,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.auto_stories,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AKSES LANGSUNG',
                                  style: GoogleFonts.manrope(
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0,
                                    color: const Color(0xFFFBE8D8),
                                  ),
                                ),
                                Text(
                                  'Baca di Tempat',
                                  style: GoogleFonts.ebGaramond(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Bebas Gangguan',
                            style: GoogleFonts.manrope(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Masuk ke mode baca hening tanpa distraksi, font serif kustom hangat, margin lapang, serta iringan aroma digital perpustakaan.',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.92),
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ReaderScreen.open(context, book);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.surfaceContainerLowest,
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mulai Membaca Sekarang',
                              style: GoogleFonts.manrope(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // OPTION 2: Unduh Arsip PDF
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: const Color(0x33D8D0C8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.file_download_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SALINAN OFFLINE',
                            style: GoogleFonts.manrope(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                              color: AppColors.secondary,
                            ),
                          ),
                          Text(
                            'Unduh Arsip PDF',
                            style: GoogleFonts.ebGaramond(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onSurface,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      book.pdfSize,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Format PDF E-book beresolusi tinggi dengan tipografi proporsional, tata letak faksimili klasik, dan stempel kurasi resmi Literava.',
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  color: AppColors.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 14),

              // Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _isDownloading ? null : _simulateDownload,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.surfaceContainerHigh,
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_isDownloading)
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                          ),
                        )
                      else
                        const Icon(
                          Icons.download,
                          size: 16,
                          color: AppColors.primary,
                        ),
                      const SizedBox(width: 8),
                      Text(
                        _isDownloading
                            ? 'Menyiapkan Arsip...'
                            : 'Unduh Berkas Lengkap (.PDF)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
