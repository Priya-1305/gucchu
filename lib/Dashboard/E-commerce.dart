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
      'image': 'assets/picture2.jpg',
    },
    {
      'name': 'Light Fancies',
      'price': '\$200',
      'image': 'assets/picture3.jpg',
    },
    {
      'name': 'Planet Ma Slad',
      'price': '\$100',
      'image': 'assets/picture4.jpg',
    },
    {
      'name': 'Cat pet barn',
      'price': '\$110',
      'image': 'assets/cat-pet-barn.jpg',
    },
    {
      'name': 'Ragdolls',
      'price': '\$190',
      'image': 'assets/Ragdolls.jpg',
    },
    {
      'name': 'Food_can_lid',
      'price': '\$50',
      'image': 'assets/Food_can_lid.jpg',
    },
    {
      'name': 'Food',
      'price': '\$90',
      'image': 'assets/Food.jpg',
    },
    {
      'name': 'Dog Food',
      'price': '\$120',
      'image': 'assets/dog-food.jpg',
    },
    // Add more products as needed
  ];

  EcommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Supplies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    product['price'],
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Handle product purchase
                    },
                    child: const Text('Buy Now'),
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
