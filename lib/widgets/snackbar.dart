
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void showCustomSnackBar(String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.blue,
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  // Use the global key to show the snackbar
  scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
}