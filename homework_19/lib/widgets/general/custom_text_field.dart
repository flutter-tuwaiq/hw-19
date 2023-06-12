import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.emailController,
    required this.label,
    required this.hint,
    this.isPassword = false,
  });

  final TextEditingController emailController;
  final String label, hint;
  final bool? isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool eyeClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: widget.emailController,
        obscureText: widget.isPassword! && !eyeClicked,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(widget.label),
          hintText: widget.hint,
          suffixIcon: widget.isPassword!
              ? InkWell(
                  onTap: () {
                    eyeClicked = !eyeClicked;
                    setState(() {});
                  },
                  child: eyeClicked
                      ? const Icon(Icons.remove_red_eye_outlined)
                      : const Icon(Icons.remove_red_eye),
                )
              : null,
        ),
      ),
    );
  }
}
