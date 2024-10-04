import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GucchuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/pets.jpg', // Replace with your background image
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6), // Semi-transparent overlay
            ),
          ),
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
                        'Explore our diverse range of tail-wagging companions waiting to fill your home with joy and endless love. Your perfect dog is just a few clicks away!',
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
                        child: Text(
                          'SIGN IN WITH GOOGLE',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
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

  // Google Sign-In function
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

      // Here you can get the access token and id token
      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;

      // You can now send these tokens to your backend server for verification
      print('Access Token: $accessToken');
      print('ID Token: $idToken');
    } catch (error) {
      print(error);
      // Handle error
    }
  }
}
