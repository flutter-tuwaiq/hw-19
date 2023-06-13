import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hw_19/components/text_field.dart';
import 'package:hw_19/screens/home_screen.dart';
import 'package:hw_19/screens/sign_up_screen.dart';
import 'package:hw_19/services/api/login.dart';

import '../constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  addToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          gradientColorsBackground,
          SafeArea(
            child: Column(
              children: [
                height96,
                const Text(
                  "Log in",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 86, 52, 117)),
                ),
                height48,
                CustomTextField(
                    hint: "Email",
                    iconName: Icons.email,
                    controller: emailController),
                CustomTextField(
                    hint: "Password",
                    iconName: Icons.lock,
                    controller: passwordController,
                    isPassword: true),
                height24,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: const Color.fromARGB(255, 86, 52, 117),
                    elevation: 0,
                    minimumSize: const Size(200, 45),
                  ),
                  child: const Text(
                    "Log in ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () async {
                    final Map body = {
                      "email": emailController.text,
                      "password": passwordController.text,
                    };
                    final response = await login(body: body);
                    print(response.body);
                    if (response.statusCode == 200) {
                      final String token =
                          jsonDecode(response.body)["data"]["token"];

                      addToken(token);

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false);
                    }
                  },
                ),
                height72,
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  },
                  child: const Text(
                    "You don't have an account? Sign up ",
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 86, 52, 117)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
