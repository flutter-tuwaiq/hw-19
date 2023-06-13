import 'package:flutter/material.dart';
import 'package:flutter_application_11/Api.dart/createuser.dart';
import 'package:flutter_application_11/pages/login.dart';

class SingUpButton extends StatelessWidget {
  const SingUpButton({
    super.key,
    required this.emailController,
    required this.password,
    required this.username,
    required this.nameController,
  });

  final TextEditingController emailController;
  final String password;
  final String username;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,

      child: ElevatedButton(
        onPressed: () async {
          final Map body = {
            "email": emailController.text,
            "password": password,
            "username": username,
            "name": nameController.text,
          };
          final response = await loginUser(body: body);
          if (response.statusCode == 200) {
                print(response.body);

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
                (route) => false);
          }
        },
        child: const Text("Sign Up"),
      ),
    );
  }
}