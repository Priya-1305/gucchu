import 'package:flutter/material.dart';
import '../CartScreen.dart';

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
      'name': 'Food Can Lid',
      'price': '\$50',
      'image': 'assets/Food_can_lid.jpg',
    },
    {
      'name': 'Planet Ma Slad',
      'price': '\$100',
      'image': 'assets/picture4.jpg',
    },
    {
      'name': 'Cat Pet Barn',
      'price': '\$110',
      'image': 'assets/cat-pet-barn.jpg',
    },
    {
      'name': 'Ragdolls',
      'price': '\$190',
      'image': 'assets/Ragdolls.jpg',
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
  ];

  EcommercePage({super.key});

  // Update addToCart method to accept BuildContext
  void addToCart(BuildContext context, String product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$product added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Supplies'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        product['image'],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.error);
                        },
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
                        addToCart(context,
                            product['name']); // Pass context and product name
                      },
                      child: Text('Add to Cart'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Product Details Page for navigation
class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              product['image'],
              fit: BoxFit.cover,
              height: 250,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const SizedBox(height: 20),
            Text(
              product['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product['price'],
              style: const TextStyle(fontSize: 20, color: Colors.teal),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Purchased ${product['name']}')),
                );
              },
              child: const Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
