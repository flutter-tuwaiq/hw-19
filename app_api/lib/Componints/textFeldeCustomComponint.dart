import 'package:flutter/material.dart';

class textfeldecustom extends StatefulWidget {
  const textfeldecustom({
    super.key,
    this.controller,
    this.onChanged,
    required this.titel,
    required this.iconData,
    this.isPassord = false,
  });
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String titel;
  final IconData iconData;
  final bool isPassord;

  @override
  State<textfeldecustom> createState() => _textfeldecustomState();
}

class _textfeldecustomState extends State<textfeldecustom> {
  @override
  Widget build(BuildContext context) {
    bool showPassword = true;

    return TextField(
      controller: widget.controller,
      // onChanged: onChanged,
      enabled: true,
      cursorColor: Colors.amber,
      cursorWidth: 5,

      decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: Icon(
            widget.iconData,
            color: Colors.black,
          ),
          labelText: widget.titel,
          // helperText: "",
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black))),
    );
  }
}



