import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/components/tap_viewer_terms.dart';
import 'package:new_eduflex/cubit/Courses/courses_cubit.dart';
import 'package:new_eduflex/screens/layoutPages/subjects.dart';

class HighSchoolLevelOnePage extends StatefulWidget {
  const HighSchoolLevelOnePage({super.key});

  static const String routeName = 'HighSchoolLevelOnePage';

  @override
  State<HighSchoolLevelOnePage> createState() => _HighSchoolLevelOnePageState();
}

class _HighSchoolLevelOnePageState extends State<HighSchoolLevelOnePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesCubit(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'High School : Level One',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 15),
            ),
          ),
          body: BlocBuilder<CoursesCubit, CoursesState>(
            builder: (context, state) {
              if (state is GetAllCoursesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetAllCoursesLoaded) {
                return const Column(
                  children: [
                    TapViewerTerms(),
                    Flexible(
                        child: TabBarView(children: [Subjects(), Subjects()]))
                  ],
                );
              } else if (state is GetAllCoursesFailed) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
