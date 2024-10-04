import 'package:flutter/material.dart';
import 'welcomScreen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vets app',
      home: Welcome(),
    );
  }
}
