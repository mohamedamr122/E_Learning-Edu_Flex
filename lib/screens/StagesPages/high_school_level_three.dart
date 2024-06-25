import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/Courses/courses_cubit.dart';
import 'package:new_eduflex/screens/layoutPages/subjects.dart';

class HighSchoolLevelThreePage extends StatefulWidget {
  const HighSchoolLevelThreePage({super.key});
  static const String routeName = 'HighSchoolLevelThreePage';

  @override
  State<HighSchoolLevelThreePage> createState() => _HighSchoolLevelThreePageState();
}

class _HighSchoolLevelThreePageState extends State<HighSchoolLevelThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'High School : Level Three',
          style: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      body: const Subjects(),
    );
  }
}
