import 'dart:convert';

import 'package:app_api/Componints/PasswordTextFeldsComponints.dart';
import 'package:app_api/Pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Componints/textFeldeCustomComponint.dart';
import '../Servaces/Api/createUser.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                textfeldecustom(
                  titel: "Name",
                  iconData: Icons.person,
                  controller: nameController,
                ),
                SizedBox(
                  height: 16,
                ),
                textfeldecustom(
                  titel: "UserName",
                  iconData: Icons.person,
                  controller: usernameController,
                ),
                SizedBox(
                  height: 16,
                ),
                textfeldecustom(
                  titel: "Email",
                  controller: emailController,
                  iconData: Icons.email,
                ),
                SizedBox(
                  height: 16,
                ),
                PasswordTextFelds(
                  controller: passwordController,
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      final Map body = {
                        "email": emailController.text,
                        "username": usernameController.text,
                        "password": passwordController.text,
                        "name": nameController.text,
                      };

                      final responce = await createUser(body: body);
                      print(responce.body);
                      if (responce.statusCode == 200) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      }
                    },
                    child: Text("Create"),
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
