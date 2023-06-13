import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/weight.dart';

class TitleOfPage extends StatelessWidget {
  const TitleOfPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(color: black, fontSize: 24, fontWeight: bold));
  }
}
