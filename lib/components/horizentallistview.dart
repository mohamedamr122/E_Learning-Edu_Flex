import 'package:flutter/material.dart';

import 'course_photo.dart';


class ListViewHorizntal extends StatelessWidget {
  const ListViewHorizntal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CoursePhoto();
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}