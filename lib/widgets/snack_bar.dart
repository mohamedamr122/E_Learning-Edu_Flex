import 'package:flutter/material.dart';
import 'package:path/path.dart';

void _showSnackbar(String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
}
