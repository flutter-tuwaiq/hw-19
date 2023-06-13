import 'package:flutter/material.dart';
import 'package:home_work19/Componants/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Center(
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: 28),
            ),
          ),
          CustomTextField(
            hint: "example@example.com",
            lable: "Email",
            controller: emailcontroller,
          ),
          CustomTextField(
            hint: "123asasa",
            lable: "Password",
            controller: passwordcontroller,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                final Map body = {
                  "email": emailcontroller.text,
                  "password": password,
                };
              },
              child: const Text('Create'),
            ),
          )
        ],
      ),
    );
  }
}
