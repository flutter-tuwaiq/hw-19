import 'package:flutter/material.dart';

import 'package:hw_19_test/component/custom_textField.dart';
import 'package:hw_19_test/pages/home_page.dart';
import 'package:hw_19_test/pages/signup_page.dart';
import 'package:hw_19_test/services/api/login_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 140, 171, 168),
          appBar: 
          AppBar(
            backgroundColor: Color.fromARGB(255, 140, 171, 168),
            title: PageLable(
              title: 'Login',
            ),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ))),
          ),
          
          body: ListView(
            children: [
              TextFieldCustom(
                hint: '****@gmail.com',
                icon: Icons.abc,
                label: 'Email',
                obscureText: false,
                controller: emailController,
              ),
              TextFieldCustom(
                hint: '********',
                icon: Icons.abc,
                label: 'Password',
                obscureText: isVisible,
                isPassword: true,
                controller: passwordController,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 97, 87),
                    ),
                    onPressed: () async {
                      final Map body = {
                        "email": emailController.text,
                        "password": passwordController.text
                      };
                      final response = await loginUser(body: body);
                      print(response.body);
                      if (response.statusCode == 200) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      }
                    },
                    child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ],
          )),
    );
  }
}
