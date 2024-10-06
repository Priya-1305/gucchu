import 'package:flutter/material.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect with Others'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Text(
          'This is the Connect page where users can interact with other pet lovers.',
          style: TextStyle(fontSize: 18, color: Colors.brown[600]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
