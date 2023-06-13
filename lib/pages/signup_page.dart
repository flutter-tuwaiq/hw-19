import 'package:flutter/material.dart';
import 'package:hw_19_test/component/custom_textField.dart';
import 'package:hw_19_test/pages/home_page.dart';
import 'package:hw_19_test/pages/login_page.dart';
import 'package:hw_19_test/services/api/create_user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isVisible = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 140, 171, 168),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 140, 171, 168),
            title: PageLable(
              title: 'Sgin up',
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
                hint: '',
                icon: Icons.person,
                label: 'Name',
                obscureText: false,
                controller: nameController,
              ),
              TextFieldCustom(
                hint: '',
                icon: Icons.person,
                label: 'Username',
                obscureText: false,
                controller: userNameController,
              ),
              TextFieldCustom(
                hint: '',
                icon: Icons.email,
                label: 'Email',
                obscureText: false,
                controller: emailController,
              ),
              TextFieldCustom(
                hint: '',
                icon: Icons.key,
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
                        "name": nameController.text,
                        "username": userNameController.text,
                        "email": emailController.text,
                        "password": passwordController.text
                      };
                      final response = await createUser(body: body);
                      print(response.body);
                      if (response.statusCode == 200) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => HomePage()),
                            (route) => false);
                      }
                    },
                    child: Text('Sign up',style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ],
          )),
    );
  }
}

class PageLable extends StatelessWidget {
  const PageLable({super.key,  this.title=''});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 0, 97, 87)),
      ),
    );
  }
}

