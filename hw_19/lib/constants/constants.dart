import 'package:flutter/material.dart';

final gradientColorsBackground = Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(247, 218, 222, 1),
        Color.fromARGB(235, 163, 88, 105),
      ],
    ),
  ),
);

const height8 = SizedBox(height: 8);
const height16 = SizedBox(height: 16);
const height24 = SizedBox(height: 24);
const height32 = SizedBox(height: 32);
const height48 = SizedBox(height: 48);
const height56 = SizedBox(height: 56);
const height72 = SizedBox(height: 72);
const height96 = SizedBox(height: 96);

const width8 = SizedBox(width: 8);
const width16 = SizedBox(width: 16);
const width24 = SizedBox(width: 24);
const width32 = SizedBox(width: 32);
