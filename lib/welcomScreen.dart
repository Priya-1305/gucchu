import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:gucchu/Widget/navigation_b.dart';
import 'package:lottie/lottie.dart';
import 'auth/conditional_routing.dart';
import 'home.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    // Timer to navigate to the dashboard after 5 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => home_Screen()), // Navigate to Dashboard
      );
    });
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: _builtUI(),
    );
  }

  Widget _builtUI() {
    return Center(
      child: Lottie.asset("assets/Animation.json", height: 200, width: 500),
    );
  }
}
