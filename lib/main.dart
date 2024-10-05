import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'welcomScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
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
