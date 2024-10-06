import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Blog'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Text(
          'This is the Blog page where users can read and contribute to blogs.',
          style: TextStyle(fontSize: 18, color: Colors.brown[600]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
