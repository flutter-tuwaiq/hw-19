import 'package:flutter/material.dart';
import 'package:hw_19/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: const SplashScreen(),
    );
  }
}
