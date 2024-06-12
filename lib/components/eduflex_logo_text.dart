import 'package:flutter/material.dart';
import 'package:new_eduflex/constants/class_color.dart';

class EduFlexLogo extends StatelessWidget {
  const EduFlexLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Edu',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            fontSize: 31,
            color: ColorManager.mainGreen,
          ),
        ),
        Text(
          'Flex',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            fontSize: 31,
            color: ColorManager.logGrey,
          ),
        ),
      ],
    );
  }
}
