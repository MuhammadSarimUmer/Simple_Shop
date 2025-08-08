import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            title: Text(
              cartItem['title'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Size: [${cartItem['size']}]"),
            trailing: Icon(Icons.delete, color: Colors.red),
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 40,
              backgroundColor: Colors.teal[50],
            ),
          );
        },
      ),
    );
  }
}
