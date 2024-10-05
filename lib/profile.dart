import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? firebaseUser) {
      setState(() {
        user = firebaseUser;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GUCCHU"),
        actions: [
          if (user != null)
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () => _showProfileDialog(),
            ),
        ],
      ),
      body: Center(
        child: user == null
            ? Text("Not signed in")
            : Text("Welcome ${user!.displayName}!"),
      ),
    );
  }

  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("User Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Name: ${user?.displayName}"),
            Text("Email: ${user?.email}"),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                GoogleSignIn().signOut();
                Navigator.of(context).pop();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
