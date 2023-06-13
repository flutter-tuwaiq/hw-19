import 'package:flutter/material.dart';

import '../Combonat/fild.dart';

class Sign_Up_Screen extends StatefulWidget {
  const Sign_Up_Screen({
    super.key,
  });

  @override
  State<Sign_Up_Screen> createState() => _Sign_Up_ScreenState();
}

final TextEditingController controllername = TextEditingController();
final TextEditingController controlleremail = TextEditingController();
final TextEditingController controllerpass = TextEditingController();
final TextEditingController controlleruser = TextEditingController();

class _Sign_Up_ScreenState extends State<Sign_Up_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const SizedBox(
          height: 40,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up Screen',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        TextfildCastom(
            hint: "Email",
            icon: Icons.email_outlined,
            controller: controlleremail),
        TextfildCastom(
            hint: "user",
            icon: Icons.supervised_user_circle_sharp,
            controller: controlleruser),
        TextfildCastom(
            hint: "name",
            icon: Icons.supervised_user_circle_sharp,
            controller: controllername),
        TextfildCastom(
            hint: "password",
            icon: Icons.password,
            ispassword: true,
            controller: controllerpass),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 150.0, right: 150.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("sapmint")),
          ),
        ),
      ]),
    );
  }
}
