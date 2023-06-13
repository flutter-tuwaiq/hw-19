import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.iconName,
      this.isPassword = false,
      required this.controller});

  final String hint;
  final IconData iconName;
  final bool? isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? isEncrypted;

  @override
  void initState() {
    isEncrypted = true;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // show and hide password icon button
    final showHidePassword = IconButton(
        onPressed: () {
          setState(() {
            isEncrypted = !isEncrypted!;
          });
        },
        icon: Icon(isEncrypted! ? Icons.visibility : Icons.visibility_off,
            color: Colors.white));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
          style: const TextStyle(color: Colors.white),
          controller: widget.controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(247, 252, 255, 0.328),
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              hintText: widget.hint,
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: Icon(widget.iconName, color: Colors.white),
              suffixIcon: widget.isPassword ?? false ? showHidePassword : null),
          obscureText: widget.isPassword ?? false ? isEncrypted! : false),
    );
  }
}
