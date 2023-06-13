import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:hw19/api/login_api.dart';
import 'package:hw19/components/app_bar.dart';
import 'package:hw19/pages/home_page.dart';

import '../components/field_text.dart';

late final String token;

class Login extends StatelessWidget {
  Login({super.key});
  //  final box = GetStorage();
  final emailController = TextEditingController();
  final passwordNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 28, 0, 0),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 18, 0, 0),
                child: Text(
                  'Welcome back',
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 28, 0, 0),
                child: FieldText(
                  textHint: 'Email',
                  icon: Icons.email_outlined,
                  controller: emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 28, 0, 0),
                child: FieldText(
                  textHint: 'Password',
                  icon: Icons.lock_outline_rounded,
                  isPassword: true,
                  controller: passwordNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(132, 24, 0, 0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(242, 37, 80, 107),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(300, 58, 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    final Map body = {
                      'email': emailController.text,
                      'password': passwordNameController.text,
                    };
                    final response = await loginApi(body: body);
                    // box.write('token',body['data']['token']);
                    // print(box.read('token'));
                    token = json.decode(response.body)['data']['token'];
                    if (response.statusCode == 200) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const homePage()),
                          (route) => false);
                    }
                    print(token);
                    print(response.body);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14),
                    backgroundColor: const Color.fromARGB(255, 37, 80, 107),
                  ),
                  child: const Icon(Icons.arrow_forward_rounded),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
