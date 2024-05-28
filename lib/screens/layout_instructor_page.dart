import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/search_page.dart';
import 'package:new_eduflex/screens/toprating_page.dart';

import '../classes/class_color.dart';
import 'account_page.dart';
import 'instructor_home_page.dart';

class LayoutInstructorPage extends StatefulWidget {
  const LayoutInstructorPage({super.key});

  @override
  State<LayoutInstructorPage> createState() => _LayoutInstructorPageState();
}

class _LayoutInstructorPageState extends State<LayoutInstructorPage> {
  final NavPages = [
    const AccountPage(),
    const SearchPage(),
    const InstructorHomePage(),
    const TopRatingPage(),
  ];
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: ColorManager.lightGray,
        buttonBackgroundColor: ColorManager.mainGreen,
        backgroundColor: ColorManager.mainGreen,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/account.png',
                color: _selectedIndex == 0 ? Colors.white : Colors.black,
              ),
              label: 'Account'),
          CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/search.png',
                color: _selectedIndex == 1 ? Colors.white : Colors.black,
                height: 25,
              ),
              label: 'Search'),
          CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/home.png',
                color: _selectedIndex == 2 ? Colors.white : Colors.black,
              ),
              label: 'Home'),
          CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/star.png',
                color: _selectedIndex == 3 ? Colors.white : Colors.black,
              ),
              label: 'Top Rating'),
        ],
      ),
      body: NavPages[_selectedIndex],
    );
  }
}
