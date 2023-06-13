import 'package:flutter/material.dart';

import '../component/custom_text_field.dart';

import '../component/sign_up_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListView(
          children: [
            const Screen(title: "Sign Up Screen"),

            // Username TextField
            CustomTextField(
              hint: "shuruq2207",
              label: "User name",
              icon: Icons.person,
              onChanged: (value) {
                username = value;
              },
            ),

            // Email TextField
            CustomTextField(
              hint: "shuruq@gmail.com",
              label: "Email",
              icon: Icons.email,
              controller: emailController,
            ),

            // Name TextField
            CustomTextField(
              hint: "shuruq",
              label: "Name",
              icon: Icons.person,
              controller: nameController,
            ),

            // Password TextField
            CustomTextField(
              hint: "Slinky2207*",
              label: "Password",
              icon: Icons.password,
              isPassword: true,
              onChanged: (value) {
                password = value;
              },
            ),

            SingUpButton(
                emailController: emailController,
                password: password,
                username: username,
                nameController: nameController),
          ],
        ),
      ),
    );
  }
}
