import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/subjects.dart';

class HighSchoolLevelThreePage extends StatelessWidget {
  const HighSchoolLevelThreePage({super.key});

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
