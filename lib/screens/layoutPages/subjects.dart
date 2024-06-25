import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/components/course_photo.dart';
import 'package:new_eduflex/cubit/Courses/courses_cubit.dart';
import 'package:new_eduflex/cubit/Courses/courses_cubit.dart';

import '../../components/subjects_text.dart';

class Subjects extends StatelessWidget {
  const Subjects({super.key});

  static const String routeName = 'Subjects';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesCubit(),
      child: BlocBuilder<CoursesCubit, CoursesState>(
        builder: (context, state) {
          if (state is GetAllCoursesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllCoursesLoaded) {
            return ListView(
              padding: const EdgeInsets.all(8),
              children: [
                const Row(
                  children: [SubjectsText(text: 'Arabic')],
                ),
                SizedBox(
                  height: 152,
                  child: ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return const CoursePhoto();
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const Row(
                  children: [SubjectsText(text: 'English')],
                ),
                SizedBox(
                  height: 152,
                  child: ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return const CoursePhoto();
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const Row(
                  children: [SubjectsText(text: 'Mathematics')],
                ),
                SizedBox(
                  height: 152,
                  child: ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return const CoursePhoto();
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const Row(
                  children: [SubjectsText(text: 'Sciences')],
                ),
                SizedBox(
                  height: 152,
                  child: ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return const CoursePhoto();
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const Row(
                  children: [SubjectsText(text: 'Social Studies')],
                ),
                SizedBox(
                  height: 152,
                  child: ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return const CoursePhoto();
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const Row(
                  children: [SubjectsText(text: 'Computer')],
                ),
                SizedBox(
                  height: 152,
                  child: ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return const CoursePhoto();
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const Row(
                  children: [SubjectsText(text: 'Drawing')],
                ),
                SizedBox(
                  height: 152,
                  child: ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return const CoursePhoto();
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            );
          } else if (state is GetAllCoursesFailed) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
