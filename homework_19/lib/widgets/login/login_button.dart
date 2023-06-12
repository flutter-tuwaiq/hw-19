import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:homework_19/screens/home_screen.dart';
import 'package:http/http.dart';
import 'package:get_storage/get_storage.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
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
            final box = GetStorage();
            box.write('token', jsonDecode(res.body)['data']['token']);

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (Route<dynamic> route) => false);
          }
        },
        child: const Text("Login"),
      ),
    );
  }
}
