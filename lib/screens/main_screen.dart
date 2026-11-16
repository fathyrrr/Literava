import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/library_provider.dart';
import '../widgets/app_header.dart';
import 'lobi/lobi_screen.dart';
import 'kurasi/kurasi_screen.dart';
import 'lorong_rak/lorong_rak_screen.dart';
import 'meja_baca/meja_baca_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const List<String> _subtitles = [
    'Lobi',
    'Kurasi',
    'Lorong Rak',
    'Meja Baca',
  ];

  static const List<Widget> _screens = [
    LobiScreen(),
    KurasiScreen(),
    LorongRakScreen(),
    MejaBacaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LibraryProvider>();
    final currentIndex = provider.currentNavIndex;

    return Scaffold(
      appBar: AppHeader(
        subtitle: _subtitles[currentIndex],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow.withValues(alpha: 0.96),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0E3A302A),
              blurRadius: 16,
              offset: Offset(0, -2),
            ),
          ],
          border: const Border(
            top: BorderSide(color: Color(0x22D8D0C8), width: 0.8),
          ),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  context,
                  index: 0,
                  currentIndex: currentIndex,
                  icon: Icons.door_front_door_outlined,
                  activeIcon: Icons.door_front_door,
                  label: 'LOBI',
                ),
                _buildNavItem(
                  context,
                  index: 1,
                  currentIndex: currentIndex,
                  icon: Icons.auto_stories_outlined,
                  activeIcon: Icons.auto_stories,
                  label: 'KURASI',
                ),
                _buildNavItem(
                  context,
                  index: 2,
                  currentIndex: currentIndex,
                  icon: Icons.shelves,
                  activeIcon: Icons.shelves,
                  label: 'LORONG RAK',
                ),
                _buildNavItem(
                  context,
                  index: 3,
                  currentIndex: currentIndex,
                  icon: Icons.import_contacts_outlined,
                  activeIcon: Icons.import_contacts,
                  label: 'MEJA BACA',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<LibraryProvider>().setNavIndex(index);
      },
      child: SizedBox(
        width: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              size: 22,
              color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 9.5,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: 0.8,
                color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
