import 'package:flutter/material.dart';

import '../screens/course_name_page.dart';


class CoursePhoto extends StatelessWidget {
  const CoursePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const CourseNamePage()),
        );
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
