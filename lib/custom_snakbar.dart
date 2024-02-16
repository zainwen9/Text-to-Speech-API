import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snaki(
    {required context, required String msg}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        duration: const Duration(milliseconds: 1200),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        content: Text(msg,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white))),
  );
}
