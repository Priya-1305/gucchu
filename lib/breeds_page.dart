import 'package:flutter/material.dart';

class BreedsPage extends StatelessWidget {
  final String category;
  final Function(String, double) onAddToCart; // Declare the callback

  BreedsPage(
      {required this.category,
      required this.onAddToCart}); // Accept the callback

  @override
  Widget build(BuildContext context) {
    // Sample breeds and prices (replace with your actual data)
    List<Map<String, dynamic>> breeds = [
      {'name': 'Labrador', 'price': 800},
      {'name': 'German Shepherd', 'price': 1200},
      {'name': 'Bulldog', 'price': 1000},
      // Add more breeds as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Breeds'),
        backgroundColor: const Color.fromARGB(255, 143, 81, 33),
      ),
      body: ListView.builder(
        itemCount: breeds.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(breeds[index]['name']),
            subtitle: Text('\$${breeds[index]['price']}'),
            trailing: ElevatedButton(
              onPressed: () {
                onAddToCart(breeds[index]['name'],
                    breeds[index]['price']); // Call the callback to add to cart
              },
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}
