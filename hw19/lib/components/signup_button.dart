import 'package:flutter/material.dart';
import 'package:hw19/extensions/next_page.dart';
import '../constants/colors.dart';
import '../services/create_account_api.dart';
import '../views/log_in.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.userNameController,
      required this.nameController});

  final String emailController;
  final String passwordController;
  final String userNameController;
  final String nameController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: black),
          onPressed: () async {
            final Map body = {
              'email': emailController,
              'password': passwordController,
              'username': userNameController,
              'name': nameController,
            };
            final response = await createAccountApi(body: body);
            print(response.statusCode);
            if (response.statusCode == 200) {
              context.nextPage(const LogIn());
            }
          },
          child: Text(
            'Next',
            style: TextStyle(color: white),
          )),
    );
  }
}
