import 'package:flutter/material.dart';

import '../classes/class_color.dart';

class MainText extends StatelessWidget {
   MainText({super.key,required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: ColorManager.logGrey,
        fontSize: 36,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
      ),
    );
  }
}
