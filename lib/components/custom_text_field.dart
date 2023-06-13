// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
   CustomTextField({
    super.key,
    required this.label,
    this.isPass=false, required this.controller,
  });
   final String label;
   final TextEditingController? controller;
  bool isPass;

  @override
  State<CustomTextField> createState() {
    return _CustomTextFieldState();
  }
}
@override
  void initState() {
  }

class _CustomTextFieldState extends State<CustomTextField> {
  late bool passHide = false;
  
  // late final String label = label;
  // late final bool isPass = isPass;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: passHide,
      controller: widget.controller,
      decoration: InputDecoration(
        label: Text(widget.label),
        suffixIcon: widget.isPass
            ? IconButton(
                icon: Icon(passHide ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(
                    () {
                      passHide = !passHide;
                    },
                  );
                },
              )
              : null,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
    );
  }
}
