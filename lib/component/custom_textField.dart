import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      this.isPassword = false,
      this.controller,
      this.onchanged,
      this.onSaved,
      this.obscureText = false});

  final String hint;
  final String label;
  final IconData icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final Function(String)? onchanged;
  final Function(String?)? onSaved;
  final bool obscureText;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  var isVisible = false;
  @override
  void initState() {
    super.initState();
    isVisible = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          enabled: true,
          controller: widget.controller,
          // onChanged: widget.onchanged,
          obscureText: isVisible,
          obscuringCharacter: "*",
          cursorColor: Colors.teal,
          cursorWidth: 5,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: widget.hint,
              labelText: widget.label,
              prefixIcon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 0, 97, 87),
              ),
              suffixIcon: widget.isPassword!
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(
                        isVisible
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: Color.fromARGB(255, 0, 97, 87),
                      ))
                  : null,
              labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 97, 87),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              border: const OutlineInputBorder(),
              disabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 0, 97, 87))),
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 0, 97, 87)))),
        ));
  }
}
