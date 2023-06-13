import 'package:flutter/material.dart';
import 'package:hw19/components/title_of_page.dart';
import '../components/form.dart';
import '../components/signup_button.dart';
import '../constants/colors.dart';
import '../constants/weight.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
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
                    const TitleOfPage(title: 'Sign Up'),
                    height24,

                    // Text fields for entering name, email, username and password.
                    FormScreen(
                        hint: 'lujain',
                        title: 'Name',
                        controller: nameController,
                        icon: Icons.person),
                    height8,
                    FormScreen(
                        hint: '@xilujain',
                        title: 'Username',
                        controller: userNameController,
                        icon: Icons.person),
                    height8,
                    FormScreen(
                        hint: 'lujainboo@gmail.com',
                        title: 'E-mail',
                        icon: Icons.email,
                        controller: emailController),
                    height8,
                    FormScreen(
                        hint: 'password',
                        title: 'Password',
                        controller: passwordController,
                        icon: Icons.remove_red_eye,
                        eyeIcon: true),
                    height8,

                    // Sign Up button to register the user.
                    SignUpButton(
                        emailController: emailController.text,
                        nameController: nameController.text,
                        passwordController: passwordController.text,
                        userNameController: userNameController.text)
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
