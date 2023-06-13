import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/Api.dart/createuser.dart';
import 'package:flutter_application_11/pages/login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,

      child: ElevatedButton(
        onPressed: () async {
          final Map body = {
            "email": emailController.text,
            "password": passwordController.text,
          };
          final response = await loginUser(body: body);
          print(json.decode(response.body)["data"]["token"]);
        
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
                (route) => false);
      
        },
        child: const Text("Login"),
      ),
    );
  }
}