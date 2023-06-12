import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/login_page.dart';
import 'package:frontend/sign_up_page.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {

    // test
    box.write('jwt','secret');
    bool isLogged = box.hasData('jwt');

    return MaterialApp(home: isLogged ? HomePage() : LoginPage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(CupertinoIcons.escape),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              icon: Icon(CupertinoIcons.signature),
            )
          ],
        ),
        body: Container(
            child: Center(
          child: Text("HOME"),
        )));
  }
}
