import 'package:flutter/material.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 140, 171, 168),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 140, 171, 168),
          ),
          body: ListView(
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 97, 87),
                    ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 97, 87),
                    ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
