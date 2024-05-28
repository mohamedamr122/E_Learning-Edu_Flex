import 'package:flutter/material.dart';

import '../components/horizentallistview.dart';
import '../components/subjects_text.dart';

class Subjects extends StatelessWidget {
  const Subjects({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        Row(
          children: [SubjectsText(text: 'Arabic')],
        ),
        const ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'English')],
        ),
        const ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Mathematics')],
        ),
        const ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Sciences')],
        ),
        const ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Social Studies')],
        ),
        const ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Computer')],
        ),
        const ListViewHorizntal(),
        Row(
          children: [SubjectsText(text: 'Drawing')],
        ),
        const ListViewHorizntal(),
      ],
    );
  }
}
