import 'package:flutter/material.dart';
import 'package:hw_20/Pages/login_page.dart';

import '../components/custom_text_field.dart';
import '../services/api/auth_api.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
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
                child: CustomTextField(
                  label: 'username',
                  controller: usernameController,
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  label: 'name',
                  controller: nameController,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    final Map body = {
                      'email': emailController.text,
                      'password': passwordController.text,
                      'username': usernameController.text,
                      'name': nameController.text,
                    };
                    final response = await createAccount(body: body);
                    print(response.body);
                    if (response.statusCode == 200) {
                      //check if context in tree
                      if (mounted) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                            (route) => false);
                      }
                    }
                  },
                  child: const Text('Sign up')),
            ),
          ],
        ),
      ),
    );
  }
}
