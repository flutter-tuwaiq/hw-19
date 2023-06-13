import 'package:flutter/material.dart';

class FieldText extends StatefulWidget {
  const FieldText(
      {super.key,
      required this.textHint,
      required this.icon,
      this.isPassword = false,
      this.controller});
  final String textHint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  State<FieldText> createState() => _FieldTextState();
}

class _FieldTextState extends State<FieldText> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: widget.textHint,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  color: const Color.fromARGB(255, 17, 16, 16),
                  onPressed: () {
                    passwordVisible = !passwordVisible;
                  },
                )
              : null,
        ),
        obscureText: widget.isPassword ? passwordVisible : false,
      ),
    );
  }
}
