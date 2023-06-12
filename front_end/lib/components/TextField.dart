import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String label;
  final bool isPassword;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

bool isUbscure = true;

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? isUbscure : false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.label,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(
                    () {
                      isUbscure = !isUbscure;
                    },
                  );
                },
                icon: isUbscure
                    ? const Icon(
                        Icons.remove_red_eye,
                        size: 20,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.remove_red_eye_outlined,
                        size: 20,
                        color: Colors.grey,
                      ),
              )
            : IconButton(
                onPressed: () {
                  widget.controller.clear();
                },
                icon: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
      ),
    );
  }
}
