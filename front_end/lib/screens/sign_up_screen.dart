import 'package:flutter/material.dart';

import '../components/TextField.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              const Text("Sign Up Page", style: TextStyle(fontSize: 40)),
              const SizedBox(height: 25),
              MyTextField(label: "Username", controller: usernameController),
              const SizedBox(height: 20),
              MyTextField(label: "Name", controller: nameController),
              const SizedBox(height: 20),
              MyTextField(label: "Email", controller: emailController),
              const SizedBox(height: 20),
              MyTextField(
                  label: "Password",
                  controller: passwordController,
                  isPassword: true),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 380,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 141, 76, 246),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
