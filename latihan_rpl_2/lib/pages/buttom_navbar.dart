import 'package:flutter/material.dart';
import 'home_page.dart';
import 'add.page.dart';
import 'search.dart';
import 'notification_page.dart';
import 'profil_page.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  void _navigate(BuildContext context, int index) {
    if (index == currentIndex) return;

    final pages = [
      const Homepage(),
      const AddPage(),
      const SearchPage(),
      const NotificationPage(),
      const ProfilPage(),
    ];

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _item(
              context,
              icon: Icons.home_outlined,
              activeIcon: Icons.home,
              label: "Home",
              index: 0,
            ),
            _item(
              context,
              icon: Icons.add_circle_outline,
              activeIcon: Icons.add_circle,
              label: "Tambah",
              index: 1,
            ),
            _item(
              context,
              icon: Icons.search_outlined,
              activeIcon: Icons.search,
              label: "Cari",
              index: 2,
            ),
            _item(
              context,
              icon: Icons.notifications_none,
              activeIcon: Icons.notifications,
              label: "Notifikasi",
              index: 3,
            ),
            _item(
              context,
              icon: Icons.person_outline,
              activeIcon: Icons.person,
              label: "Profil",
              index: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context, {
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final active = currentIndex == index;

    return GestureDetector(
      onTap: () => _navigate(context, index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: active
              ? Colors.blue.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              active ? activeIcon : icon,
              color: active ? Colors.blue : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                color: active ? Colors.blue : Colors.grey,
                fontSize: 11,
                fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
