import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GucchuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            Text(
              'GUCCHU',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Handle profile click
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Handle cart click
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Handle notifications
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/pets.jpg', // Replace with your background image
              fit: BoxFit.cover, // Ensures the image covers the entire screen
              alignment: Alignment.center,
            ),
          ),
          // Overlay to darken the image
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6), // Semi-transparent overlay
            ),
          ),
          // Main Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 100.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GUCCHU',
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'A HOME for every Dog, a DOG for every home',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Explore our diverse range of tail-wagging companions waiting to fill your home with joy and endless love.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white60,
                        ),
                      ),
                      SizedBox(height: 30),

                      // Add Google Sign-In button
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[300], // Button color
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          onPressed: () async {
                            await _signInWithGoogle();
                          },
                          child: ElevatedButton(
                              onPressed: () {
                                _signInWithGoogle();
                              },
                              child: Text('google'))),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                // Footer Section...
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // You can now send these tokens to your backend server for verification
      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;

      print('Access Token: $accessToken');
      print('ID Token: $idToken');
    } catch (error) {
      print(error);
      // Handle error
    }
  }
}
