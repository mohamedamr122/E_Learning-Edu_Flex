import 'package:flutter/material.dart';

import '../constants/class_color.dart';

class SubjectsText extends StatelessWidget {
  final String text;
  const SubjectsText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            bottom: 2,
          ),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: ColorManager.mainGreen,
            width: 2.0,
          ))),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
