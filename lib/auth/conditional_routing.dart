import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import '../Main_Dashboard/User_dashboard21.dart'; // Import your User Dashboard
import '../Main_Dashboard/admindashboard.dart'; // Import your Admin Dashboard

class AuthService {
  // Function to handle login and conditional navigation
  Future<void> handleAuth(BuildContext context) async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Check if user is signed in
    if (user != null) {
      // Print user's email for debugging
      print("Current user email: ${user.email}");

      // Check user's email
      if (user.email == "priyasirohi902@gmail.com") {
        // Navigate to Admin Dashboard if email matches
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Admin_Dashboard()),
        );
      } else {
        // Navigate to User Dashboard for any other email
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  User_Dashboard()), // Use UserDashboard from user_dashboard.dart
        );
      }
    } else {
      print("No user is currently signed in.");
    }
  }
}

// Sign-In Widget
class SignInWidget extends StatelessWidget {
  final AuthService authService =
      AuthService(); // Create instance of AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Replace with your Firebase Auth sign-in logic
              UserCredential userCredential =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: "test@example.com", // Use actual email from user input
                password: "password123", // Use actual password from user input
              );

              // Call the auth handler after successful sign-in
              authService.handleAuth(context);
            } catch (e) {
              print("Sign-in failed: $e");
              // Handle sign-in errors
            }
          },
          child: Text("Sign In"),
        ),
      ),
    );
  }
}

// Admin Dashboard (Placeholder for admin features)
class Admin_Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: Center(
        child: Text("Welcome Admin! You have all the permissions."),
      ),
    );
  }
}
