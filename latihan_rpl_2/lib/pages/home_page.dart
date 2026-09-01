import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final nama = data?["nama"] ?? "Tidak diketahui";
    final umur = data?["umur"] ?? 0;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/palen.png"),
            Text(
              "Nama saya $nama",
              style: GoogleFonts.delius(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Text(
              "Umur saya $umur",
              style: GoogleFonts.delius(fontSize: 15),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Beranda"),
            selectedColor: Colors.black,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.explore),
            title: const Text("Jelajahi"),
            selectedColor: Colors.black,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Cari"),
            selectedColor: Colors.black,
          ),

          SalomonBottomBarItem(
            icon: const Icon(Icons.verified_user_sharp),
            title: const Text("Profil"),
            selectedColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
