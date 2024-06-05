import 'package:flutter/material.dart';

import '../components/horizentallistview.dart';
import '../components/subjects_text.dart';

class Subjects extends StatelessWidget {
  const Subjects({super.key});
  static const String routeName = 'Subjects';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const [
        Row(
          children: [SubjectsText(text: 'Arabic')],
        ),
        ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'English')],
        ),
        ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Mathematics')],
        ),
        ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Sciences')],
        ),
        ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Social Studies')],
        ),
        ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Computer')],
        ),
        ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Drawing')],
        ),
        ListViewHorizntal(),
      ],
    );
  }
}
