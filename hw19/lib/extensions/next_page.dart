import 'package:flutter/material.dart';

extension Nav on BuildContext {
  nextPage(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }
}