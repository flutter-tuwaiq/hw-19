import 'package:flutter/material.dart';
import 'package:hw_19_test/pages/get_start_page.dart';
import 'package:hw_19_test/pages/home_page.dart';
import 'package:hw_19_test/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authcontainer extends StatefulWidget {
  const Authcontainer({super.key});

  @override
  State<Authcontainer> createState() => _AuthcontainerState();
}

class _AuthcontainerState extends State<Authcontainer> {
  late String token;
  bool initial = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  void getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token')!;
    setState(() {
      initial = false;
    });
  }

  @override
  build(BuildContext context) async {
    if (initial) {
      return const CircularProgressIndicator();
    } else {
      if (token == null) {
        return LoginPage();
      }
      return HomePage();
    }
  }
}
