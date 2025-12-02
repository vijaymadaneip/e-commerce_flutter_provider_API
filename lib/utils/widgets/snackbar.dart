import 'package:flutter/material.dart';

void showCustomMessage(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message, style: TextStyle(color: Colors.black)),
    duration: const Duration(seconds: 2),

    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
