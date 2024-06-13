import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/layoutPages/search_page.dart';
import 'package:new_eduflex/screens/layoutPages/wishlist_page.dart';

import '../../constants/class_color.dart';
import '../MyAccountPage/account_page.dart';
import 'student_home_page.dart';
import '../layoutPages/mycourses_page.dart';

class LayoutStudentPage extends StatefulWidget {
  const LayoutStudentPage({super.key});
  static const String routeName = 'LayoutStudentPage';

  @override
  State<LayoutStudentPage> createState() => _LayoutStudentPageState();
}

class _LayoutStudentPageState extends State<LayoutStudentPage> {
  final navPages = [
    const AccountPage(),
     SearchPage(),
    const StudentHomePage(),
    const WishListPage(),
    const MyCoursesPage()
  ];
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(size: 18),
        unselectedFontSize: 13,
        selectedLabelStyle: const TextStyle(
            color: ColorManager.mainGreen,
            fontSize: 14,
            fontWeight: FontWeight.w700),
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
            label: 'Wish List',
            icon: Icon(
              size: 35,
              Icons.star_border_rounded,
              color:
                  _selectedIndex == 3 ? ColorManager.mainGreen : Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'My Courses',
            icon: Image.asset(
              width: 30,
              height: 30,
              'assets/icons/play.png',
              color:
                  _selectedIndex == 4 ? ColorManager.mainGreen : Colors.black,
            ),
          ),
        ],
      ),
      body: navPages[_selectedIndex],
    );
  }
}
