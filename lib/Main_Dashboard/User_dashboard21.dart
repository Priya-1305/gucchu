import 'package:flutter/material.dart';
import '../Widget/navigation_b.dart';

class User_Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Navigation_bar(), // Bottom navigation for Find Pet, Accessories, Vets, etc.
    );
  }
}
