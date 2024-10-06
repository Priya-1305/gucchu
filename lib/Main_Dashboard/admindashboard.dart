import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Admin_Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Approve or Reject Local Host Applications'),
            trailing: ElevatedButton(
              onPressed: () {
                // Code to approve or reject the application
              },
              child: Text('Manage'),
            ),
          ),
          // Add other administrative features here
        ],
      ),
    );
  }
}
