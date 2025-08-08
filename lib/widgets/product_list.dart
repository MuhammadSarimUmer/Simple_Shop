import 'package:flutter/material.dart';
import 'package:shop_app/widgets/global_variables.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  late String selected_filter;
  String search_query = '';

  @override
  void initState() {
    super.initState();
    selected_filter = filters[0];
  }

  // Search aur filter ke liye products ko filter karne ka function
  List<Map<String, dynamic>> getFilteredProducts() {
    List<Map<String, dynamic>> filtered_products = products;

    // Pehle search filter apply karo
    if (search_query.isNotEmpty) {
      filtered_products = filtered_products.where((product) {
        return product['title'].toString().toLowerCase().contains(
          search_query.toLowerCase(),
        );
      }).toList();
    }

    // Phir company filter apply karo
    if (selected_filter != 'All') {
      filtered_products = filtered_products.where((product) {
        return product['company'].toString() == selected_filter;
      }).toList();
    }

    return filtered_products;
  }

  @override
  Widget build(BuildContext context) {
    final filtered_products = getFilteredProducts();

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Shoes\nCollection',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      search_query = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30),
                        right: Radius.circular(0),
                      ),
                      borderSide: BorderSide(color: Colors.grey[400]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30),
                        right: Radius.circular(0),
                      ),
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.grey[600],
                    ),
                    enabled: true,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_filter = filter;
                      });
                    },
                    child: Chip(
                      label: Text(
                        filter,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      backgroundColor: (filter == selected_filter)
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey[200],
                      side: BorderSide(color: Colors.white),
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: filtered_products.isEmpty
                ? Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  )
                : ListView.builder(
                    itemCount: filtered_products.length,
                    itemBuilder: (context, index) {
                      final product = filtered_products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'].toString(),
                          price: product['price'] as double,
                          image: product['imageUrl'].toString(),
                          bgcolor: index.isEven
                              ? Colors.red[50]
                              : Colors.blue[50],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
