import 'package:flutter/material.dart';
import 'package:new_eduflex/components/gradient_text.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});
  static const String routeName = 'MyCoursesPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const GradientText(
          text: 'My Courses',
        ),
      ),
    );
  }
}
