import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    this.controller,
    this.onChanged,
    this.isPassword = false,
  });

  final String hint;
  final String label;
  final IconData icon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool? isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        enabled: true,
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.isPassword! ? obscurePassword : false,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hint,
          labelText: widget.label,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                )
              : null,
          labelStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          border: const OutlineInputBorder(),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent),
          ),
        ),
      ),
    );
  }
}
