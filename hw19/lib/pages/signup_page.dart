import 'package:flutter/material.dart';

import '../api/create_user.dart';
import '../components/app_bar.dart';
import '../components/field_text.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
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
                  'Sign up',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 18, 0, 0),
                child: Text(
                  'Create an account here',
                  style: TextStyle(
                      fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 28, 0, 0),
                child: FieldText(
                  textHint: 'user name',
                  icon: Icons.person_outlined,
                  controller: userNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 28, 0, 0),
                child: FieldText(
                  textHint: 'name',
                  icon: Icons.tag_faces,
                  controller: nameController,
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
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 28, 0, 0),
                child: Text(
                  'By signing up you agree with our Terms of Use',
                  style: TextStyle(color: Color.fromARGB(255, 37, 80, 107)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(300, 48, 0, 0),
                child: ElevatedButton(
                  onPressed: () async {
                    final Map body = {
                      'email': emailController.text,
                      'password': passwordNameController.text,
                      'username': userNameController.text,
                      'name': nameController.text
                    };
                    final response = await createUser(body: body);
                    if (response.statusCode == 200) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => false);
                    }
                    print(response.body);
                    // print(userNameController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14),
                    backgroundColor: const Color.fromARGB(255, 37, 80, 107),
                  ),
                  child: const Icon(Icons.arrow_forward_rounded),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 42, 0, 0),
                child: Row(
                  children: [
                    const Text(
                      'Already a member?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color.fromARGB(242, 37, 80, 107),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
