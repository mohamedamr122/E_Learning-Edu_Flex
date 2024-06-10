import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/skills.dart';
import 'package:new_eduflex/screens/university.dart';

import '../screens/high_school_level_one.dart';
import '../screens/middle_school_level_one.dart';
import '../screens/primary_stage.dart';
import 'levelsclass.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LevelsClass(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const PrimaryStagePage()),
                ),
                text: 'Primary Stage',
              ),
              LevelsClass(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const MiddleSchoolLevelOnePage()),
                ),
                text: 'Middle School',
              ),
              LevelsClass(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const HighSchoolLevelOnePage()),
                ),
                text: 'High School',
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LevelsClass(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const UniversityPage()),
                ),
                text: 'University',
              ),
              const SizedBox(
                width: 16,
              ),
              LevelsClass(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SkillsPage()),
                ),
                text: 'Skills',
              ),
            ],
          )
        ],
      ),
    );
  }
}
