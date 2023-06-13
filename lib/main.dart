import 'package:flutter/material.dart';
import 'package:hw_19_test/pages/auth_container.dart';
import 'package:hw_19_test/pages/get_start_page.dart';
import 'package:hw_19_test/pages/home_page.dart';
import 'package:hw_19_test/pages/login_page.dart';
import 'package:hw_19_test/pages/signup_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      
      routes: {
        '/start':(context) => const GetStartPage(),
        '/signup':(context) => const SignUpPage(),
        '/login':(context) => const LoginPage(),
        '/home':(context) => const HomePage(),
        },
      home: const Authcontainer(),
    );
  }
}
