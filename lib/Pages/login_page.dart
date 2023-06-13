import 'dart:convert';

import 'package:flutter/material.dart';

import '../components/custom_text_field.dart';
import '../services/api/auth_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  label: 'email',
                  controller: emailController,
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  label: 'password',
                  isPass: true,
                  controller: passwordController,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    final Map body = {
                      'email': emailController.text,
                      'password': passwordController.text,
                    };
                    final response = await loginAccount(body: body);
                    print(response.body);
                    if (response.statusCode == 200) {
                      // to save token in local storage
                      // await storage.write(
                      //     key: 'token',
                      //     value: jsonDecode(response.body)['data']['token']);
                      box.write('darkmode',
                          jsonDecode(response.body)['data']['token']);
                      if (mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      }
                    }
                  },
                  child: const Text('Sign in')),
            ),
          ],
        ),
      ),
    );
  }
}
