import 'package:flutter/material.dart';

InputDecoration textinputdeco(String label, String hint) {
  return InputDecoration(
    labelText: label,
    hintText: hint,
    labelStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.black38),
    fillColor: Colors.white,
    filled: true,
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black38, width: 1.5)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.5)),
  );
}
