// ignore_for_file: must_be_immutable, unused_element

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hw19/constants/weight.dart';
import '../constants/colors.dart';

class FormScreen extends StatefulWidget {
  const FormScreen(
      {super.key,
      required this.title,
      required this.hint,
      required this.icon,
      this.eyeIcon = false,
      this.controller});

  final String title;
  final String hint;
  final IconData icon;
  final bool? eyeIcon;
  final TextEditingController? controller;
  @override
  State<FormScreen> createState() => _FormScreenState();
}

bool hiddenPassword = true;

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: TextStyle(color: black, fontWeight: bold, fontSize: 16)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                obscureText: widget.eyeIcon! && hiddenPassword ? true : false,
                controller: widget.controller,
                style: TextStyle(color: white),

                // show/hide the password using an eye icon.
                decoration: InputDecoration(
                    suffixIcon: widget.eyeIcon!
                        ? InkWell(
                            onTap: () {
                              setState() {
                                hiddenPassword = false;
                              }
                            },
                            child: hiddenPassword == true
                                ? const Icon(Icons.visibility_off)
                                : Icon(widget.icon))
                        : Icon(widget.icon),
                    suffixIconColor: white,
                    hintText: widget.hint,
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: black,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black)),
                    labelStyle:
                        TextStyle(color: black, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
