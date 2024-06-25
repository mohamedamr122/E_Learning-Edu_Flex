import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/course_photo.dart';
import '../../cubit/Courses/courses_cubit.dart';

class UniversityPage extends StatefulWidget {
  const UniversityPage({super.key});
  static const String routeName = 'UniversityPage';

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'University',
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
