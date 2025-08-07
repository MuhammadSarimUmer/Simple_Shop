import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color? bgcolor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.all(20.0),
      color: bgcolor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '\$$price',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green[700],
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            Center(child: Image(image: AssetImage(image), height: 150)),
          ],
        ),
      ),
    );
  }
}
