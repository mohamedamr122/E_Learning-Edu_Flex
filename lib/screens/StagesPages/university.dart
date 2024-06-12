import 'package:flutter/material.dart';
import '../../components/horizentallistview.dart';

class UniversityPage extends StatelessWidget {
  const UniversityPage({super.key});
  static const String routeName = 'UniversityPage';

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
        children: const [ListViewHorizntal()],
      ),
    );
  }
}
