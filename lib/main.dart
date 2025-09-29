import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const BrioApp());
}

class BrioApp extends StatelessWidget {
  const BrioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

