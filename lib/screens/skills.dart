import 'package:flutter/material.dart';

import '../components/horizentallistview.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});
  static const String routeName = 'SkillsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Skills',
          style: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      body: ListView(
        children: const [ListViewHorizntal()],
      ),
    );
  }
}
