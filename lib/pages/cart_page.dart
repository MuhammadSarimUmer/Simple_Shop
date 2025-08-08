import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    if (cart == null || cart.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart', style: TextStyle(fontSize: 20)),
          centerTitle: true,
        ),
        body: Center(child: Text('Your cart is empty')),
      );
    } else {
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
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Center(
                          child: Text(
                            'Remove from Cart',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        content: Text(
                          'Are you sure you want to remove this item from the cart?',
                          style: TextStyle(fontSize: 14),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(
                                context,
                                listen: false,
                              ).deleteProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'No',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
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
}
