import 'package:flutter/material.dart';

class TopRatingPage extends StatelessWidget {
  const TopRatingPage({super.key});
  static const String routeName = 'TopRatingPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/toprating_screen/Top rating.png'),
      ),
      body: ListView(),
    );
  }
}
