import 'package:flutter/material.dart';
import 'package:new_eduflex/classes/class_color.dart';

class LevelsSelected extends StatelessWidget {
  String text;
  void Function()? onPressed;
  LevelsSelected({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: const WidgetStatePropertyAll(Colors.white),
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(Colors.blueGrey[100]),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
