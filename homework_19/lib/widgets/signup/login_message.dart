import 'package:flutter/material.dart';

import '../../screens/login_screen.dart';

class LoginMessage extends StatelessWidget {
  const LoginMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account ? "),
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false);
          },
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
