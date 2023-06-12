import 'package:flutter/material.dart';
import 'package:hw_19/component/screen_title.dart';
import '../component/custom_text_field.dart';
import '../component/login_button.dart';

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
          const ScreenTitle(title: "Login Screen"),

          // Email TextField
          CustomTextField(
            hint: "ziyad@gmail.com",
            label: "Email",
            icon: Icons.email,
            controller: emailController,
          ),
          
          // Password TextField
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


