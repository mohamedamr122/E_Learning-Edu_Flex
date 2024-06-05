import 'package:flutter/material.dart';
import 'package:new_eduflex/components/gradient_text.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});
  static const String routeName = 'WishListPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const GradientText(text: 'Wish List'),
      ),
      body: const CustomScrollView(
        slivers: [],
      ),
    );
  }
}
