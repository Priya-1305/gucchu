import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Application.dart';
import '../localFarm.dart';
import '../CartScreen.dart'; // Import the CartScreen file
import '../orderScreen.dart';

class GucchuApp extends StatefulWidget {
  @override
  _GucchuAppState createState() => _GucchuAppState();
}

class _GucchuAppState extends State<GucchuApp> {
  List<String> cartItems = []; // List to hold cart items
  User? user; // Variable to hold user information

  @override
  void initState() {
    super.initState();
  }

  // Method to add items to the cart
  void addToCart(String itemName) {
    setState(() {
      cartItems.add(itemName); // Add item to the cart
    });
    print('Current cart items: $cartItems'); // Debugging line
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$itemName added to cart')),
    );

    // Navigate to the CartScreen after adding the item
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CartScreen(cartItems: cartItems), // Pass cartItems here
      ),
    );
  }

  // A static method can handle generic functionalities
  static void handleStaticFunctionality() {
    print('This is a static method for some other functionality.');
  }

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
                color: Colors.brown,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(width: 10),
          if (user != null)
            IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () {
                _showProfileDialog(); // Display user profile and logout option
              },
            ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Navigate to CartScreen and pass cartItems
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CartScreen(cartItems: cartItems), // Pass cartItems here
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.airplay, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LocalFarm(
                    onAddToCart: (String itemName, double price) {
                      addToCart(itemName); // Use addToCart method
                    },
                  ),
                ),
              ); // Navigate to LocalFarm
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
                        'Connecting Pet Lovers with Local Hosts to Find Their Fur Baby',
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

                      // Google Sign-In button
                      if (user == null)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[300], // Button color
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          onPressed: () async {
                            await _signInWithGoogle();
                          },
                          child: Text('Sign in with Google'),
                        ),
                      if (user != null)
                        Center(
                          child: Text(
                            "Welcome, ${user?.displayName}!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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

  // Google Sign-In Method
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

      // Authenticate with Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      setState(() {
        user = userCredential.user; // Update user after successful sign-in
      });

      // Show a Snackbar for successful sign-in
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Signed in successfully as ${user!.displayName}")),
      );
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  // Show User Profile and Logout option
  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("User Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (user != null) ...[
              Text("Name: ${user!.displayName}"),
              Text("Email: ${user!.email}"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Application()),
                  );
                },
                child: Text('Become the Local Host'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  GoogleSignIn().signOut();
                  setState(() {
                    user = null; // Update state after logging out
                  });
                  Navigator.of(context).pop();
                },
                child: Text("Logout"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Orders screen with dummy data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(
                        orderItems: [
                          'Golden Retriever',
                          'Bulldog'
                        ], // Example order items
                        totalPrice: 800.0, // Example total price
                      ), // Navigates to the OrderScreen with dummy data
                    ),
                  );
                },
                child: Text('View Orders'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
