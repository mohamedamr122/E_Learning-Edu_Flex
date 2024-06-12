import 'package:flutter/material.dart';
import 'package:new_eduflex/components/gradient_text.dart';

class UploadCourseInfo extends StatelessWidget {
  const UploadCourseInfo({super.key});
  static const String routeName = 'UploadCourseInfo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const GradientText(text: 'Course Name'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Notes!',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '1 - The video must be uploaded in MP4 format.',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '2 - Each video should be numbered in ascending order to indicate its sequence.',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '3 - The video quality should be a minimum of 480 px.',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
