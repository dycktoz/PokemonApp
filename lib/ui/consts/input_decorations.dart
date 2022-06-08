import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 57, 160, 93), width: 2)),
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: Color.fromARGB(255, 57, 160, 93)),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Color.fromARGB(255, 57, 160, 93),
              )
            : null);
  }
}
