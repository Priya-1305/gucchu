import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage(
      {super.key,
      required String title,
      required String description,
      required List sections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        color: Colors.white, // Background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const Text(
              'Welcome to the Community!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.brown, // Header color
              ),
            ),
            const SizedBox(height: 16),

            // Introductory Description
            Text(
              'Join our community and connect with fellow pet lovers. Share experiences, read our blog, and discover more about pet care.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.brown[600],
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Expanded(
              child: ListView(
                children: [
                  // Connect Option
                  CommunityOption(
                    icon: Icons.people,
                    label: 'Connect',
                    description:
                        'Connect with other pet lovers and share experiences.',
                    onPressed: () {
                      // Add your "Connect" action here
                    },
                  ),
                  const SizedBox(height: 16),

                  // Blog Option
                  CommunityOption(
                    icon: Icons.article,
                    label: 'Blog',
                    description: 'Read and contribute to our community blog.',
                    onPressed: () {
                      // Add your "Blog" action here
                    },
                  ),
                  const SizedBox(height: 16),

                  // More Option
                  CommunityOption(
                    icon: Icons.more_horiz,
                    label: 'More',
                    description: 'Discover more resources, tips, and guides.',
                    onPressed: () {
                      // Add your "More" action here
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define the CommunityOption widget
class CommunityOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;
  final VoidCallback onPressed;

  const CommunityOption({
    super.key,
    required this.icon,
    required this.label,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.brown.withOpacity(0.2), // Light brown background
      ),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.brown),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: 16, color: Colors.brown[600]),
        ),
        trailing: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text(
            'Explore',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
