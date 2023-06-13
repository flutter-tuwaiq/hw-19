import 'dart:convert';

import 'package:app_api/Componints/PasswordTextFeldsComponints.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Componints/textFeldeCustomComponint.dart';
import '../Servaces/Api/LoginUser.dart';
import '../Servaces/Api/createUser.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
                        "password": passwordController.text,
                      };

                      final responce = await loginUser(body: body);
                      print(responce.body);

                      // final token = (json.decode(responce.body)["data"]["token"]);
                      // SharedPreferences AccessToken = await SharedPreferences.getInstance();
                      // AccessToken.setInt("Token", token);

                      if (responce.statusCode == 200) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      }
                    },
                    child: Text("Login"),
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
