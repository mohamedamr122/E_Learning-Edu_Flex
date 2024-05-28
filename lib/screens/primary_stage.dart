import 'package:flutter/material.dart';

import '../components/horizentallistview.dart';

class PrimaryStagePage extends StatelessWidget {
  const PrimaryStagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Primary Stage',
          style: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ),
      body: ListView(
        children: const [
          ListViewHorizntal(),
        ],
      ),
    );
  }
}
