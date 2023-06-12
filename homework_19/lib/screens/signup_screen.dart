import 'package:flutter/material.dart';
import 'package:homework_19/services/api.dart';
import '../widgets/signup/login_message.dart';
import '../widgets/signup/signup_button.dart';
import '../widgets/signup/signup_fields.dart';
import '../widgets/general/card_title.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const CardTitle(title: "Signup"),
                      SignupFields(
                        emailController: emailController,
                        passwordController: passwordController,
                        usernameController: usernameController,
                        nameController: nameController,
                      ),
                      SignupButton(
                        onSubmit: () {
                          return signup({
                            "email": emailController.text,
                            "password": passwordController.text,
                            "username": usernameController.text,
                            "name": nameController.text
                          });
                        },
                      ),
                      const LoginMessage(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
