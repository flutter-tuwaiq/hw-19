import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PasswordTextFelds extends StatefulWidget {
  PasswordTextFelds({super.key, required this.controller});

  final TextEditingController? controller;
  @override
  State<PasswordTextFelds> createState() => _PasswordTextFeldsState();
}

class _PasswordTextFeldsState extends State<PasswordTextFelds> {
  final passwordContainer = TextEditingController();
  bool HintPassord = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      // width: 200,
      child: TextField(
        obscureText: HintPassord,
        controller: widget.controller,
        enabled: true,
        cursorColor: Colors.amber,
        cursorWidth: 5,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            suffix: IconButton(
              onPressed: () {
                setState(() {
                  if (HintPassord) {
                    HintPassord = false;
                  } else {
                    HintPassord = true;
                  }
                });
              },
              icon: Icon(
                  HintPassord == true ? Icons.remove_red_eye : Icons.password),
            ),
            labelText: "Password",
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }
}
