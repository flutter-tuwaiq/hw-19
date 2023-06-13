
import 'package:flutter/material.dart';
import 'package:hw_20/Pages/home_page.dart';
import 'package:hw_20/Pages/login_page.dart';

import '../services/api/auth_api.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoggedIn = false;
  late Future<dynamic> _futureAuthVerify;

  @override
  void initState() {
    super.initState();
    // _futureAuthVerify = tokenInitialized();
    String token = box.read('token').toString().isEmpty ? box.read('token') : '';

    // to get token from local storage
    // var token = await getToken();
    // print('1:$_futureAuthVerify');
    print('2:$token');

    if (token == '') {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false);
      }
    } else {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          // FutureBuilder(
          //     future: _futureAuthVerify,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         if (snapshot.data!.statusCode == 200) {
          //           return const HomePage();
          //         } else {
          //           return const LoginPage();
          //         }
          //       } else if (snapshot.hasError) {
          //         return Text('${snapshot.error}');
          //       } else {
          //         return Container(
          //             color: Colors.white,
          //             child: const Center(
          //                 child: CircularProgressIndicator(color: Colors.black45)));
          //       }
          //     }),
          Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
