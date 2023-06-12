import 'package:flutter/material.dart';

import '../component/custom_text_field.dart';
import '../component/screen_title.dart';
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

            const ScreenTitle(title: "Sign Up Screen"),

            // Username TextField
            CustomTextField(
              hint: "ziyad123",
              label: "User name",
              icon: Icons.person,
              onChanged: (value) {
                username = value;
              },
            ),

            // Email TextField
            CustomTextField(
              hint: "ziyad@gmail.com",
              label: "Email",
              icon: Icons.email,
              controller: emailController,
            ),

            // Name TextField
            CustomTextField(
              hint: "Ziyad",
              label: "Name",
              icon: Icons.person,
              controller: nameController,
            ),

            // Password TextField
            CustomTextField(
              hint: "2nf340g359g@R",
              label: "Password",
              icon: Icons.password,
              isPassword: true,
              onChanged: (value) {
                password = value;
              },
            ),

            SingUpButton(emailController: emailController, password: password, username: username, nameController: nameController),
          ],
        ),
      ),
    );
  }
}


