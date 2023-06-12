import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homework_19/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final bool tokenFound = box.read("token") == null;
    return tokenFound
        ? const LoginScreen()
        : const Scaffold(
            body: Center(
              child: Text('Home!'),
            ),
          );
  }
}
