import 'package:flutter/material.dart';
import 'package:new_eduflex/components/gradient_text.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GradientText(
          text: 'My Courses',
        ),
      ),
    );
  }
}
