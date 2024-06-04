import 'package:flutter/material.dart';

class LevelsClass extends StatelessWidget {
  const LevelsClass({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 103,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto'),
          ),
        ),
      ),
    );
  }
}
