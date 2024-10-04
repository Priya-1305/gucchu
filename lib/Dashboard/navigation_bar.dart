import 'package:flutter/material.dart';
import 'Find_your_gucchu.dart'; // Import the GucchuApp page

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
    GucchuApp(), // First page now properly linked to GucchuApp
    Center(
        child: Text('Vets and Care')), // Placeholder for the Vets and Care page
    Center(
        child: Text(
            'Food & Accessories')), // Placeholder for the Food and Accessories page
    Center(child: Text('Community')), // Placeholder for the Community page
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
