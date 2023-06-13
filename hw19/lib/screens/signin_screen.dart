import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Screen(title: "Login Screen"),

          // Email TextField
          CustomTextField(
            hint: "shuruq@gmail.com",
            label: "Email",
            icon: Icons.email,
            controller: emailController,
          ),

          // Password TextField
          CustomTextField(
            hint: "Slinky2207*",
            label: "Password",
            icon: Icons.password,
            isPassword: true,
            controller: passwordController,
          ),

          LoginButton(
              emailController: emailController,
              passwordController: passwordController),
        ],
      ),
    );
  }
}
