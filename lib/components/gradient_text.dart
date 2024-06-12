import 'package:flutter/material.dart';
import 'package:new_eduflex/constants/class_color.dart';

class GradientText extends StatelessWidget {
  const GradientText({super.key, required this.text});
  final String text;
  final LinearGradient _gradient = const LinearGradient(colors: [
    ColorManager.mainGreen,
    Color(0xffF2F2F2),
  ]);
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return _gradient.createShader(rect);
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontFamily: 'Roboto',
            fontSize: 31,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontStyle: FontStyle.italic),
      ),
    );
  }
}
