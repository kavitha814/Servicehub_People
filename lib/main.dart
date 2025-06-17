import 'package:flutter/material.dart';
import 'package:servicehubpeople/home_screen.dart';
import 'package:servicehubpeople/signup.dart'; 

void main() {
  // App entry point
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ServiceHub People',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFF2E2E38),
      ),
      home:  HomeScreen(), // Show SignUpScreen first
    );
  }
}
