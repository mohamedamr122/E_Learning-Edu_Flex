import 'package:flutter/material.dart';
import 'package:new_eduflex/classes/class_color.dart';

class TapViewerTerms extends StatelessWidget {
  const TapViewerTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: ColorManager.mainGreen,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const TabBar(
          dividerHeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelStyle: TextStyle(color: ColorManager.forgotGray),
          indicatorColor: ColorManager.mainGreen,
          overlayColor: WidgetStatePropertyAll(ColorManager.mainGreen),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(
              child: Text(
                'First text',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Tab(
              child: Text(
                'Second term',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
