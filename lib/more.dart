import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Resources'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Text(
          'This is the More page where users can find additional resources and guides.',
          style: TextStyle(fontSize: 18, color: Colors.brown[600]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
