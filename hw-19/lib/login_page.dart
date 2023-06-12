import 'package:flutter/material.dart';

import 'api.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;

  var emailC = TextEditingController();
  var passC = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                labelText: 'UserName',
              ),
              onChanged: (String? val) {
                emailC.text = val!;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              // maxLength: 8,
              minLines: 1,
              // keyboardType: TextInputType.text,
              keyboardType: TextInputType.visiblePassword,
              // controller: controller.titleController,
              maxLines: 1,

              // style: UtilsImporter().uStyleUtils.loginTextFieldStyle(),
              enableSuggestions: false,
              autocorrect: false,
              textDirection: TextDirection.ltr,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(
                      () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
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
                  await api().userLogin(emailC.text, passC.text);
                },
                child: Text("Login")),
          )
        ],
      ),
    );
  }
}
