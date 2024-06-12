import 'package:flutter/material.dart';

import '../constants/class_color.dart';

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          color: ColorManager.textGray,
          fontWeight: FontWeight.w500),
    );
  }
}
