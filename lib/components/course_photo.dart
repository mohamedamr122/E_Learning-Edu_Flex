import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/details_course_buy.dart';

class CoursePhoto extends StatelessWidget {
  const CoursePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsCourseBuy.routeName);
      },
      child: Container(
        width: 162,
        height: 152,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage('assets/images/home_screen/courseImage.png'),
          ),
        ),
      ),
    );
  }
}
