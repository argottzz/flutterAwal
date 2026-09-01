import 'package:flutter/material.dart';

import 'buttom_navbar.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text("Profil"),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "Halaman Profil",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        currentIndex: 4,
      ),
    );
  }
}