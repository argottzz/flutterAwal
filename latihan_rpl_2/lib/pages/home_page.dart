import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latihan_rpl_2/addproduct.dart';
import 'package:latihan_rpl_2/editproduct.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> product = [];

  Future<void> getProduct() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    if (response.statusCode == 200) {
      setState(() {
        product = jsonDecode(response.body);
      });
    } else {
      print("data gagal diambil");
    }
  }

  Future<void> deleteProduct(int id) async {
    final response = await http.delete(
      Uri.parse('https://fakestoreapi.com/products/$id'),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Produk Berhasil Dihapus: ${response.statusCode}'),
        ),
      );

      setState(() {
        product.removeWhere((product) => product['id'] == id);
      });
    } else {
      print('Gagal menghapus produk: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          final itemProduct = product[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProductPage(product: itemProduct),
                ),
              );
            },
            child: ListTile(
              leading: Image.network(itemProduct["image"]),
              title: Text(itemProduct["title"]),
              subtitle: Text("Harga: ${itemProduct["price"]}"),
              trailing: IconButton(
                onPressed: () {
                  deleteProduct(itemProduct['id']);
                },
                icon: Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
