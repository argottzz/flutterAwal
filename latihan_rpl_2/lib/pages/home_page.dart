import 'package:flutter/material.dart';
import 'buttom_navbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text("Umur saya $umur"),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
