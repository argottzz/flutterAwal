import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final data = ['Flutter', 'NextJs', 'Express'];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 150,
          child: Stack(
            children: [
              Container(
                color: Colors.amber,
                child: Image.network(
                  "https://asset.kompas.com/crops/FfDI1GFNmsFlm_k64xRfWcKV2UI=/115x71:965x637/1200x1200/data/photo/2022/09/19/63287c7b036ba.jpg",
                ),
                width: 200,
                height: 150,
              ),

              Positioned(
                top: 10,
                right: 10,
                child: IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
              ),

              Positioned(top: 10, left: 10, child: Chip(label: Text("New"))),
            ],
          ),
        ),
      ),
    );
  }
}
