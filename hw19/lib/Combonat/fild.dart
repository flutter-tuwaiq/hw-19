import 'package:flutter/material.dart';

class TextfildCastom extends StatefulWidget {
  const TextfildCastom({
    super.key,
    required this.hint,
    this.ispassword,
    required this.icon,
    required this.controller,
  });
  final String hint;
  final bool? ispassword;
  final icon;
  final TextEditingController controller;

  @override
  State<TextfildCastom> createState() => _TextfildCastomState();
}

class _TextfildCastomState extends State<TextfildCastom> {
  var iconpasson = const Icon(Icons.remove_red_eye_outlined);
  var iconpassof = const Icon(Icons.remove_red_eye);
  var sper;
  var eyeicon;
  int eyepass = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.ispassword == null) {
    } else if (widget.ispassword == true) {
      eyeicon = InkWell(
        child: iconpasson,
        onTap: () {
          sper = iconpasson;
          iconpasson = iconpassof;
          iconpassof = sper;
          eyepass++;

          setState(() {});
        },
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        obscureText: eyepass % 2 == 0 && widget.ispassword == true,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: Icon(widget.icon),
            hintText: widget.hint,
            suffixIcon: eyeicon),
      ),
    );
  }
}
