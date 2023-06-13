import 'package:flutter/material.dart';
import '../../hw-19/lib/Screens/sing_up_screen.dart';

class LogingScreen extends StatefulWidget {
  const LogingScreen({super.key});

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  final emailcontrolor = TextEditingController();
  final passwordcontrolor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          LabelScreen(title: 'logimscreen',) ,
          
           Textfield(
              hint: 'email',
             label: 'email',
              icon: Icons.person,
              controller: emailcontrolor,
             ),

              Textfield(
              hint: 'password',
             label: 'password',
              icon: Icons.person,
              controller: passwordcontrolor,
             ),
      





      ],),







    );
  }
}
class LabelScreen extends StatelessWidget {
  const LabelScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Center(
            child: Text(title)) ;
  }
}