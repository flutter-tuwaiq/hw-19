import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.pageName});
  final Widget pageName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.of(context).push(
     MaterialPageRoute(builder: (context){
      return pageName ;
     },),
    );
    },style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),padding: const EdgeInsets.all(14),
      backgroundColor: const Color.fromARGB(255, 37, 80, 107),
    ),
     child: const Icon( Icons.arrow_forward_rounded),
    );
  }
}