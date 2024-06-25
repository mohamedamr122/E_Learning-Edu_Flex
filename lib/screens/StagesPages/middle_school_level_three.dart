import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/components/tap_viewer_terms.dart';
import 'package:new_eduflex/cubit/Courses/courses_cubit.dart';
import 'package:new_eduflex/screens/layoutPages/subjects.dart';

class MiddleSchoolLevelThreePage extends StatefulWidget {
  const MiddleSchoolLevelThreePage({super.key});
  static const String routeName = 'MiddleSchoolLevelThreePage';

  @override
  State<MiddleSchoolLevelThreePage> createState() => _MiddleSchoolLevelThreePageState();
}

class _MiddleSchoolLevelThreePageState extends State<MiddleSchoolLevelThreePage> {
  void initState(){
    super.initState();
    BlocProvider.of<CoursesCubit>(context).getAllCourses();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Middle School : Level three',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 15),
          ),
        ),
        body: const Column(
          children: [
            TapViewerTerms(),
            Flexible(child: TabBarView(children: [Subjects(), Subjects()]))
          ],
        ),
      ),
    );
  }
}
