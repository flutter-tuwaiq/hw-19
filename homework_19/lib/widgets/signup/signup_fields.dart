import 'package:flutter/material.dart';

import '../general/custom_text_field.dart';

class SignupFields extends StatelessWidget {
  const SignupFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
    required this.nameController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          emailController: emailController,
          label: "Email",
          hint: "example@gmail.com",
        ),
        CustomTextField(
          emailController: passwordController,
          label: "Password",
          hint: "ABcd#1234",
          isPassword: true,
        ),
        CustomTextField(
          emailController: usernameController,
          label: "Username",
          hint: "user123",
        ),
        CustomTextField(
          emailController: nameController,
          label: "Name",
          hint: "Ahmad",
        ),
      ],
    );
  }
}
