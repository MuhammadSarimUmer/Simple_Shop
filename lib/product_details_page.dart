import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int? selected_chip;
  @override
  void initState() {
    super.initState();
    selected_chip = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details'), centerTitle: true),
      body: Column(
        children: [
          Center(
            child: Text(
              widget.product['title'],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),

          Spacer(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image(
              image: AssetImage(widget.product['imageUrl'] as String),
              width: 400,
            ),
          ),
          Spacer(flex: 2),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Text(
                  '\$${widget.product['price']}',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product['sizes'].length,
                    itemBuilder: (context, index) {
                      final size = widget.product['sizes'][index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected_chip = size;
                            });
                          },
                          child: Chip(
                            label: Text('$size'),
                            backgroundColor: selected_chip == size
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    icon: Icon(Icons.add_shopping_cart, color: Colors.black),
                    label: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
