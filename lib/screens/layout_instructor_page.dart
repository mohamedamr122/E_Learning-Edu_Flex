import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/search_page.dart';
import 'package:new_eduflex/screens/toprating_page.dart';

import '../constants/class_color.dart';
import 'account_page.dart';
import 'instructor_home_page.dart';

class LayoutInstructorPage extends StatefulWidget {
  const LayoutInstructorPage({super.key});
  static const String routeName = 'LayoutInstructorPage';

  @override
  State<LayoutInstructorPage> createState() => _LayoutInstructorPageState();
}

class _LayoutInstructorPageState extends State<LayoutInstructorPage> {
  final navPages = [
    const AccountPage(),
     SearchPage(),
    const InstructorHomePage(),
    const TopRatingPage(),
  ];
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 12,
        selectedLabelStyle: const TextStyle(color: Colors.amber),
        selectedItemColor: ColorManager.mainGreen,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedFontSize: 13,
        backgroundColor: Colors.grey[60],
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Account',
            icon: Image.asset(
              'assets/icons/account.png',
              color:
                  _selectedIndex == 0 ? ColorManager.mainGreen : Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(
              size: 30,
              Icons.search_outlined,
              color:
                  _selectedIndex == 1 ? ColorManager.mainGreen : Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(
              'assets/icons/home.png',
              color:
                  _selectedIndex == 2 ? ColorManager.mainGreen : Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Top Rating',
            icon: Icon(
              size: 35,
              Icons.star_border_rounded,
              color:
                  _selectedIndex == 3 ? ColorManager.mainGreen : Colors.black,
            ),
          ),
        ],
      ),
      body: navPages[_selectedIndex],
    );
  }
}
