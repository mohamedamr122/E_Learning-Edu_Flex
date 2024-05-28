import 'package:flutter/material.dart';
import 'package:new_eduflex/components/tap_viewer_terms.dart';
import 'package:new_eduflex/screens/subjects.dart';

class HighSchoolLevelOnePage extends StatelessWidget {
  const HighSchoolLevelOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'High School : Level One',
            style: TextStyle(
                fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
        body: const Column(
            children: [
              TapViewerTerms(),
              Expanded(child: TabBarView(children: [Subjects(), Subjects()]))
            ],
          ),
      ),
    );
  }
}
