import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/Courses/courses_cubit.dart';

import '../../components/course_photo.dart';


class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});
  static const String routeName = 'SkillsPage';

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Skills',
          style: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      body: ListView(
        children:  [SizedBox(
          height: 152,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const CoursePhoto();
            },
            scrollDirection: Axis.horizontal,
          ),
        )],
      ),
    );
  }
}
