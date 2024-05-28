import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  GradientText({super.key, required this.text});
  String text;
  final LinearGradient _gradient = const LinearGradient(colors: [
    Color(0xff00BF63),
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