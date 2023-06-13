import 'package:flutter/material.dart';
import 'package:hw_19/components/text_field.dart';
import 'package:hw_19/screens/login_screen.dart';

import '../constants/constants.dart';
import '../services/api/create_account.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                  "Create New Acocunt",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 86, 52, 117)),
                ),
                height48,
                // ------- text fields
                CustomTextField(
                    hint: "Name",
                    iconName: Icons.person,
                    controller: nameController),
                CustomTextField(
                    hint: "Email",
                    iconName: Icons.email,
                    controller: emailController),
                CustomTextField(
                    hint: "Username",
                    iconName: Icons.abc,
                    controller: usernameController),
                CustomTextField(
                    hint: "Password",
                    iconName: Icons.lock,
                    controller: passwordController,
                    isPassword: true),
                height24,
                // ------- sign up button
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
                    "Sign Up ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () async {
                    final Map body = {
                      "email": emailController.text,
                      "password": passwordController.text,
                      "name": nameController.text,
                      "username": usernameController.text
                    };
                    final response = await createAccount(body: body);
                    print(response.body);
                    if (response.statusCode == 200) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                          (route) => false);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
