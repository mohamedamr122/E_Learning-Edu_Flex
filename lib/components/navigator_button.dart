import 'package:flutter/material.dart';

class MyNavigatorButton extends StatelessWidget {
  const MyNavigatorButton(
      {super.key,
      required this.textColor,
      required this.onTap,
      required this.height,
      required this.width,
      required this.color,
      required this.text});
  final double height;
  final double width;
  final Function()? onTap;
  final Color color;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: 'Roboto',
            ),
          ),
        ),
      ),
    );
  }
}
