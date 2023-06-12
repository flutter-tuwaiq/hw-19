import 'package:flutter/material.dart';
import 'package:homework_19/services/api.dart';
import '../widgets/general/card_title.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/login_fields.dart';
import '../widgets/login/signup_message.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                      const CardTitle(title: "Login"),
                      LoginFields(
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      LoginButton(
                        onSubmit: () {
                          return login({
                            "email": emailController.text,
                            "password": passwordController.text,
                          });
                        },
                      ),
                      const SignupMessage(),
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
