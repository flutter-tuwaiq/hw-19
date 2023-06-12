import 'package:flutter/material.dart';

import '../Screens/Signin_screen.dart';
import '../services/api/createUser.dart';

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
          final response = await createUser(body: body);
          print(response.body);
          if (response.statusCode == 200) {
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