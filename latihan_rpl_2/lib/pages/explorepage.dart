import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'home_page.dart';
import 'profil_page.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class ExplorePage extends AddPage {
  const ExplorePage({super.key});
}

class _AddPageState extends State<AddPage> {
  var _currentIndex = 1; 

  void _onTap(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    // navigasi antar halaman jika diperlukan
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Homepage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProfilPage()),
      );
    }
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 1:
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          itemCount: 20,
          itemBuilder: (_, i) => Card(
            child: ListTile(
              leading: const Icon(Icons.explore, color: Colors.green),
              title: Text("Jelajahi ${i + 1}"),
              subtitle: const Text("Konten explore"),
            ),
          ),
        );
      case 0:
        return const Center(
          child: Text(
            "Halaman Beranda",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      case 2:
        return const Center(
          child: Text(
            "Halaman Profil",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      default:
        return const Center(
          child: Text(
            "Halaman Tambah",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text("Jelajahi"),
        backgroundColor: Colors.green,
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
