import 'package:flutter/material.dart';

import '../../screens/signup_screen.dart';

class SignupMessage extends StatelessWidget {
  const SignupMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
                (Route<dynamic> route) => false);
          },
          child: const Text(
            "Signup",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
