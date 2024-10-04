import 'package:flutter/material.dart';

class ECommercePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ECommercePage(),
    );
  }
}

class _ECommercePage extends StatefulWidget {
  @override
  _ECommercePageState createState() => _ECommercePageState();
}

class _ECommercePageState extends State<_ECommercePage> {
  final List<Product> _products = [
    Product(
        name: 'Dog Food',
        price: 20.0,
        imageUrl: 'https://via.placeholder.com/150'),
    Product(
        name: 'Cat Toy',
        price: 5.0,
        imageUrl: 'https://via.placeholder.com/150'),
    Product(
        name: 'Bird Cage',
        price: 50.0,
        imageUrl: 'https://via.placeholder.com/150'),
    Product(
        name: 'Fish Tank',
        price: 100.0,
        imageUrl: 'https://via.placeholder.com/150'),
    Product(
        name: 'Dog Leash',
        price: 15.0,
        imageUrl: 'https://via.placeholder.com/150'),
  ];

  final List<Product> _cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Products Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: _cart),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(product.imageUrl, height: 80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.name, style: TextStyle(fontSize: 16)),
                ),
                Text('\$${product.price}',
                    style: TextStyle(color: Colors.grey)),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _cart.add(product);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('${product.name} added to cart'),
                    ));
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cart.isEmpty
          ? Center(child: Text('No items in cart'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                );
              },
            ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
