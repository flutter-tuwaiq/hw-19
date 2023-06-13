import 'package:flutter/material.dart';
import '../hw-19/lib/Screens/sing_up_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SingUp()
    );
  }
}
