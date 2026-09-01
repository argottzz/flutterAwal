import 'package:flutter/material.dart';
import 'buttom_navbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: const Text("Pencarian"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          "Halaman Pencarian",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}