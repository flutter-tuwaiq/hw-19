import 'package:flutter/material.dart';
import 'package:hw_19/screens/home_screen.dart';
import 'package:hw_19/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print(token);
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: getToken() != null
              ? const HomeScreen()
              : InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    "Press to Login",
                    style: TextStyle(fontSize: 28, color: Colors.blue),
                  ))),
    );
  }
}
