import 'package:flutter/material.dart';
import 'package:hw_19_test/pages/signup_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 140, 171, 168),
            title: PageLable(
              title: 'Home Page',
            ),
            leading: IconButton(
                onPressed: (){ Navigator.of(context).pushNamed('/start');},
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
          Center(
            child: Text('Welcome'),
          )
        ],
      )),
    );
  }
}
