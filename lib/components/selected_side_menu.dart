import 'package:flutter/material.dart';
import 'package:new_eduflex/classes/class_color.dart';

class SelectedItemSideMenu extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const SelectedItemSideMenu({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        overlayColor: WidgetStatePropertyAll(Colors.white),
        elevation: WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(ColorManager.lightGray),
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
