import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.lable,
    this.icon,
    this.isPassword = false,
    this.controller,
  });

  final String hint;
  final String lable;
  final IconData? icon;
  final bool? isPassword;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        enabled: true,
        cursorColor: const Color.fromARGB(255, 8, 98, 110),
        cursorWidth: 8,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
            labelText: lable,
            labelStyle: const TextStyle(
              color: Colors.black12,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            border: const OutlineInputBorder(),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyanAccent))),
      ),
    );
  }
}
