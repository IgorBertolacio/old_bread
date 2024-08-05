import 'package:flutter/material.dart';

InputDecoration getAuthenticationInputDecoration(String label){
  return InputDecoration(
    label: Text(label),
    filled: false,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8)
  );
}