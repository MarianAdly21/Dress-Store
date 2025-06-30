import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.white,
        content: Text(
          message,
          
          style: const TextStyle(
              fontSize: 19, fontWeight: FontWeight.bold, color: Colors.black),
        )),
  );
}
