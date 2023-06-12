import 'package:flutter/material.dart';

import '../general/custom_text_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

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
      ],
    );
  }
}
