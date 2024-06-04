import 'package:flutter/material.dart';

class HeadLineText extends StatelessWidget {
  const HeadLineText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 15, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
    );
  }
}
