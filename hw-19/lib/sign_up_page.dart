import 'package:flutter/material.dart';
import 'package:frontend/api.dart';
import 'package:get_storage/get_storage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage() : super();

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailC = TextEditingController();
  var passC = TextEditingController();
  var userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              minLines: 1,
              keyboardType: TextInputType.text,
              maxLines: 1,
              enableSuggestions: false,
              autocorrect: false,
              textDirection: TextDirection.ltr,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                labelText: 'UserName',
              ),
              onChanged: (String? val) {
                userName.text = val!;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              minLines: 1,
              keyboardType: TextInputType.text,
              maxLines: 1,
              enableSuggestions: false,
              autocorrect: false,
              textDirection: TextDirection.ltr,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
              onChanged: (String? val) {
                emailC.text = val!;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              minLines: 1,
              keyboardType: TextInputType.visiblePassword,
              maxLines: 1,
              enableSuggestions: false,
              autocorrect: false,
              textDirection: TextDirection.ltr,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                labelStyle: TextStyle(fontFamily: 'Cairo'),
              ),
              onChanged: (String? val) {
                passC.text = val!;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                onPressed: () async {
                  await api().userCreate(emailC.text, passC.text, userName.text, userName.text);
                },
                child: Text("SignUp")),
          ),
        ],
      ),
    );
  }
}
