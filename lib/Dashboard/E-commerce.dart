import 'package:flutter/material.dart';

class EcommercePage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Mat Le Buys',
      'price': '\$99',
      'image': 'assets/toy.png',
    },
    {
      'name': 'Natt 9 Feeds',
      'price': '\$150',
      'image': 'assets/product2.png',
    },
    {
      'name': 'Light Fancies',
      'price': '\$200',
      'image': 'assets/product3.png',
    },
    {
      'name': 'Planet Ma Slad',
      'price': '\$100',
      'image': 'assets/product4.png',
    },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Supplies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items in a row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4, // Adjust the size of each item
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      product['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    product['price'],
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Handle product purchase
                    },
                    child: Text('Buy Now'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: EcommercePage(),
//   ));
// }
