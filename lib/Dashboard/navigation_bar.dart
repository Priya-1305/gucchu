import 'package:flutter/material.dart';
import 'Find_your_gucchu.dart'; // Import the GucchuApp page
import 'E-commerce.dart';
import 'VetAndCare.dart'; // Import the E-Commerce
import 'Community.dart';

class Navigation_bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        primaryColor: Colors.brown, // Set the primary color to brown
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Pages corresponding to the sections
  final List<Widget> _pages = [
    GucchuApp(), // Find Your Gucchu Page
    VeterinaryCarePage(), // Placeholder for Vets and Care
    EcommercePage(),
    CommunityPage(),
    // E-Commerce Page for Food and Accessories
    // Placeholder for the Community page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Content of the current page
          _pages[_currentIndex],

          // Bottom Navigation Bar (pinned to the bottom)
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              unselectedItemColor: Color.fromARGB(255, 231, 169, 146),
              selectedItemColor:
                  Colors.brown, // Highlight the selected item in brown
              onTap: _onItemTapped, // Switch pages on tap
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.pets),
                  label: 'Find Your Gucchu',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_hospital),
                  label: 'Vets and Care',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Food & Accessories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Community',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
