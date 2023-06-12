import 'package:flutter/material.dart';
import 'package:homework_19/screens/login_screen.dart';
import 'package:http/http.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
    required this.onSubmit,
  });

  final Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black)),
        onPressed: () async {
          Response res = await onSubmit.call();

          print(res.statusCode);
          print(res.body);

          if (res.statusCode == 200) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false);
          }
        },
        child: const Text("Signup"),
      ),
    );
  }
}
