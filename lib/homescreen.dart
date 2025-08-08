import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_page.dart';

import 'package:shop_app/product_list.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];

  final List<Widget> pages = const [ProductList(), CartPage()];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
      body: IndexedStack(index: currentPage, children: pages),
    );
  }
}
