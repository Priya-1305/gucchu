import 'package:flutter/material.dart';
import 'CartScreen.dart';

class LocalFarm extends StatefulWidget {
  final Function(String, double) onAddToCart; // Add named parameter

  // Add named parameter to constructor
  LocalFarm({Key? key, required this.onAddToCart}) : super(key: key);

  @override
  _LocalFarmState createState() => _LocalFarmState();
}

class _LocalFarmState extends State<LocalFarm> {
  List<String> cartItems = [];
  String? selectedCategory; // To track selected category

  // Define animals and their respective breeds
  final Map<String, List<Map<String, dynamic>>> animalData = {
    'Dogs': [
      {'name': 'Golden Retriever', 'price': 500},
      {'name': 'Bulldog', 'price': 300},
      {'name': 'Beagle', 'price': 400},
    ],
    'Cats': [
      {'name': 'Persian Cat', 'price': 350},
      {'name': 'Siamese Cat', 'price': 450},
    ],
    'Birds': [
      {'name': 'Parrot', 'price': 100},
      {'name': 'Canary', 'price': 150},
    ],
  };

  // Function to add to cart
  void addToCart(String itemName, double price) {
    setState(() {
      cartItems.add(itemName); // Add item to the cart
    });

    // Call the onAddToCart function passed from the parent widget
    widget.onAddToCart(itemName, price);

    // Navigate to cart screen after adding to cart
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(cartItems: cartItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Farm'),
      ),
      body: selectedCategory == null
          ? _buildCategorySelection() // Show categories if no category is selected
          : _buildBreedSelection(
              selectedCategory!), // Show breeds if category is selected
    );
  }

  // Widget to show category selection (Dogs, Cats, Birds)
  Widget _buildCategorySelection() {
    return ListView(
      children: animalData.keys.map((category) {
        return ListTile(
          title: Text(category),
          onTap: () {
            setState(() {
              selectedCategory = category; // Set selected category
            });
          },
        );
      }).toList(),
    );
  }

  // Widget to show breeds for the selected category
  Widget _buildBreedSelection(String category) {
    final breeds =
        animalData[category]!; // Get breeds for the selected category
    return ListView.builder(
      itemCount: breeds.length,
      itemBuilder: (context, index) {
        final breed = breeds[index];
        return ListTile(
          title: Text(breed['name'] as String), // Cast to String
          subtitle: Text(
              '\$${(breed['price'] as int).toDouble()}'), // Cast to int and convert to double
          trailing: ElevatedButton(
            onPressed: () {
              addToCart(breed['name'] as String,
                  (breed['price'] as int).toDouble()); // Add to cart
            },
            child: Text('Add to Cart'),
          ),
        );
      },
    );
  }
}
