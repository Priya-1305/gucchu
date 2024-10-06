import 'package:flutter/material.dart';
import '../Care.dart';
//import 'Community.dart';

class VeterinaryCarePage extends StatelessWidget {
  const VeterinaryCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/hero.jpg', // Background image
              fit: BoxFit.cover, // Ensures the image covers the entire screen
              alignment: Alignment.center,
            ),
          ),

          // Overlay to darken the image for better text visibility
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
            ),
          ),

          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Space between elements
              children: [
                // Top Center: Bold Text
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Veterinary Care for Your Beloved Pets",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                    textAlign: TextAlign.center, // Center the text
                  ),
                ),

                // Centered: Lightweight Text
                const Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Comprehensive health services and expert guidance for all your pet's needs.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white, // Text color
                          ),
                          textAlign: TextAlign.center, // Center the text
                        ),
                        SizedBox(height: 12), // Space between texts
                        Text(
                          "At Gucchu, we are passionate about providing top-notch veterinary care. "
                          "From regular check-ups to emergency treatments, we ensure your pets get the "
                          "love and attention they deserve. Trust our experienced team of veterinarians to help "
                          "your furry friends live a long, healthy life.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white, // Text color
                          ),
                          textAlign: TextAlign.center, // Center the text
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom: Column for buttons with added spacing
                Column(
                  children: [
                    // Add spacing above the buttons
                    const SizedBox(height: 24), // Adjust height as needed

                    // Row for both buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Space between buttons
                      children: [
                        // Contact Us Button
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text(
                            "Contact Us",
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                        const SizedBox(
                            width: 16), // Add spacing between buttons

                        // Navigate to Care Page Button
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the Care Page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CarePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          child: const Text("Care",
                              style: TextStyle(color: Colors.brown)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 60), // Add extra spacing below buttons
              ],
            ),
          ),
        ],
      ),
    );
  }
}
