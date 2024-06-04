import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
  const ItemButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon});
  final void Function()? onPressed;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: const ButtonStyle(
          shadowColor: WidgetStatePropertyAll(Colors.white),
          overlayColor: WidgetStatePropertyAll(Colors.white),
          alignment: Alignment.topLeft,
          elevation: WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(Colors.white)),
      onPressed: onPressed,
      icon: icon,
      label: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xff272727),
        ),
      ),
    );
  }
}
