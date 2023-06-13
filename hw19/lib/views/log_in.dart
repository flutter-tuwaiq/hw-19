import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hw19/components/title_of_page.dart';
import 'package:hw19/extensions/next_page.dart';
import 'package:hw19/views/sign_up.dart';
import '../components/form.dart';
import '../constants/colors.dart';
import '../constants/weight.dart';
import '../services/login_api.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.only(top: 166.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: white,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100))),
            width: MediaQuery.of(context).size.width,
            height: 650,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    height24,
                    const TitleOfPage(title: 'Log In'),
                    height24,

                    // Text fields for entering email and password.
                    FormScreen(
                      hint: 'lujainboo@gmail.com',
                      title: 'E-mail',
                      icon: Icons.email,
                      controller: emailController,
                    ),
                    height8,
                    const FormScreen(
                      hint: 'password',
                      title: 'Password',
                      icon: Icons.remove_red_eye,
                      eyeIcon: true,
                    ),
                    height8,

                    // Login button to authenticate the user.
                    Center(
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(backgroundColor: black),
                          onPressed: () async {
                            final Map body = {
                              'email': emailController.text,
                              'password': passwordController.text,
                            };
                            final response = await logInApi(body: body);
                            log(jsonDecode(response.body)['data']['token']);
                            if (response.statusCode == 200) {
                              context.nextPage(const SignUp());
                            }
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(color: white),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
