import 'package:flutter/material.dart';
import 'package:flutter_application_11/pages/LoginButton.dart';
import 'package:flutter_application_11/pages/MyTextFieldWidget.dart';
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

          CustomTextField(
            hint: "jjjjjjjjjgmail.com",
            label: "Email",
            icon: Icons.email,
            controller: emailController,
          ),
          CustomTextField(
            hint: "2r43g3@#%&2dfc",
            label: "Password",
            icon: Icons.password,
            isPassword: true,
            controller: passwordController,
          ),

          LoginButton(emailController: emailController, passwordController: passwordController),
        ],
      ),
    );
  }
}