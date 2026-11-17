import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';

class EpigraphCard extends StatefulWidget {
  const EpigraphCard({super.key});

  @override
  State<EpigraphCard> createState() => _EpigraphCardState();
}

class _EpigraphCardState extends State<EpigraphCard> {
  int _currentIndex = 0;

  static const List<Map<String, String>> _epigraphs = [
    {
      'quote': '“Aku selalu membayangkan surga akan menjadi sejenis perpustakaan.”',
      'author': 'Jorge Luis Borges',
      'ref': 'Naskah Klasik #1941',
    },
    {
      'quote': '“Kamu memiliki kekuasaan atas pikiranmu, bukan peristiwa luar. Sadarilah ini, dan kamu akan menemukan kekuatan sejati.”',
      'author': 'Marcus Aurelius',
      'ref': 'Meditations IV.3',
    },
    {
      'quote': '“Kalian boleh maju dalam pelajaran, tapi tanpa mencintai sastra, kalian hanya hewan yang pandai.”',
      'author': 'Pramoedya Ananta Toer',
      'ref': 'Bumi Manusia',
    },
    {
      'quote': '“Bukan karena segala sesuatu itu sulit maka kita tidak berani, tetapi karena kita tidak berani maka segala sesuatu menjadi sulit.”',
      'author': 'Seneca',
      'ref': 'Epistulae Morales',
    },
    {
      'quote': '“Kecantikan yang abadi terletak pada keelokan adab dan ketinggian ilmu seseorang, bukan pada pakaiannya.”',
      'author': 'Buya Hamka',
      'ref': 'Falsafah Hidup',
    },
  ];

  void _nextQuote() {
    HapticFeedback.selectionClick();
    setState(() {
      _currentIndex = (_currentIndex + 1) % _epigraphs.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final epigraph = _epigraphs[_currentIndex];

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
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
                  const Icon(
                    Icons.format_quote,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'CATATAN KURATOR HARI INI',
                    style: GoogleFonts.manrope(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: _nextQuote,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.cached,
                        size: 15,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Kocok',
                        style: GoogleFonts.manrope(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: Column(
              key: ValueKey<int>(_currentIndex),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  epigraph['quote']!,
                  style: GoogleFonts.ebGaramond(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '— ${epigraph['author']!}',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    Text(
                      epigraph['ref']!,
                      style: GoogleFonts.manrope(
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                        color: AppColors.secondary,
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
