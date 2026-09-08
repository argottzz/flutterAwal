import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'home_page.dart';
import 'explorepage.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  var _currentIndex = 2; // 0: Beranda, 1: Jelajahi, 2: Profil

  void _onTap(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AddPage()),
      );
    }
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 2:
        return ListView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          children: const [
            SizedBox(height: 20),
            Icon(Icons.person, size: 80, color: Colors.pink),
            SizedBox(height: 16),
            Center(
              child: Text(
                "Halaman Profil",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text("email@example.com"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.badge_outlined),
                title: Text("User Profil"),
              ),
            ),
          ],
        );
      case 0:
        return const Center(
          child: Text(
            "Halaman Beranda",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      case 1:
        return const Center(
          child: Text(
            "Halaman Jelajahi",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text("Profil"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: BottomBar(
        layout: const BottomBarLayout.adaptive(
          maxWidth: 420,
          offset: 16,
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        motion: const BottomBarMotion.cupertino(
          preset: BottomBarCupertinoMotion.snappy,
        ),
        theme: BottomBarThemeData(
          barDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: Color(0x18000000),
                blurRadius: 28,
                offset: Offset(0, 16),
              ),
            ],
          ),
        ),
        body: BottomBarBodyPadding(child: _buildBody()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: BottomBarItems(
            children: [
              BottomBarItem(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
                label: const Text("Beranda"),
                selected: _currentIndex == 0,
                onTap: () => _onTap(0),
              ),
              BottomBarItem(
                icon: const Icon(Icons.explore_outlined),
                selectedIcon: const Icon(Icons.explore),
                label: const Text("Jelajahi"),
                selected: _currentIndex == 1,
                onTap: () => _onTap(1),
              ),
              BottomBarItem(
                icon: const Icon(Icons.person_outline),
                selectedIcon: const Icon(Icons.person),
                label: const Text("Profil"),
                selected: _currentIndex == 2,
                onTap: () => _onTap(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
