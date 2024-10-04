import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Dashboard/navigation_bar.dart';

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
            builder: (context) => Navigation_bar()), // Navigate to Dashboard
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
