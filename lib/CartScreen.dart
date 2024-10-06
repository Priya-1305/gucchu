import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<String> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index]), // Display the name of the breed
          );
        },
      ),
      // Adding persistent footer buttons
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            _showOrderPlacedDialog(context); // Call function to show dialog
          },
          child: Text('Buy Now'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Background color
          ),
        ),
      ],
    );
  }

  // Function to show dialog when order is placed
  void _showOrderPlacedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Placed'),
          content: Text('Your order has been successfully placed!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
