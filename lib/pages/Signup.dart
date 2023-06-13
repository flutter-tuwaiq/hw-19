
import 'package:flutter/material.dart';
import 'package:flutter_application_11/pages/MyTextFieldWidget.dart';
import 'package:flutter_application_11/pages/SingUpButton.dart';

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

            CustomTextField(
              label: "User name",
              hint: "arwa",

              icon: Icons.person,
              onChanged: (value) {
                username = value;
              },
            ),

            CustomTextField(
              label: "Email",
              hint: "klhhhhhh7777@gmail.com",
              icon: Icons.email,
              controller: emailController,
            ),

            CustomTextField(
              label: "Name",
             hint: "arwa",
              icon: Icons.person,
              controller: nameController,
            ),
            CustomTextField(
              hint: "2hh87",
              label: "Password",
              icon: Icons.password_sharp,
              isPassword: true,
              onChanged: (value) {
                password = value;
              },
            ),

            SingUpButton( nameController: nameController,emailController: emailController, password: password, username: username,)
          ],
        ),
      ),
    );
  }
}