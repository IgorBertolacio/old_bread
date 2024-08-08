import 'package:flutter/material.dart';

ShowSnackbar(
    {required BuildContext context,
    required String value,
    bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(value),
    backgroundColor: isErro ? Colors.red : Colors.green,
    showCloseIcon: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    duration: const Duration(seconds: 5),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
