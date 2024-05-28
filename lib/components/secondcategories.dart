
import 'package:flutter/material.dart';

import '../screens/skills.dart';
import '../screens/university.dart';
import 'levelsclass.dart';

class SecondCategories extends StatelessWidget {
  const SecondCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
      child: Row(
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
              MaterialPageRoute(
                  builder: (context) => const SkillsPage()),
            ),
            text: 'Skills',
          ),
        ],
      ),
    );
  }
}