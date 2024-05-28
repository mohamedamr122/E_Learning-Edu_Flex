import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/search_page.dart';
import 'package:new_eduflex/screens/wishlist_page.dart';

import '../classes/class_color.dart';
import 'account_page.dart';
import 'student_home_page.dart';
import 'mycourses_page.dart';

class LayoutStudentPage extends StatefulWidget {
  const LayoutStudentPage({super.key});

  @override
  State<LayoutStudentPage> createState() => _LayoutStudentPageState();
}

class _LayoutStudentPageState extends State<LayoutStudentPage> {
  final NavPages = [
    const AccountPage(),
    const SearchPage(),
    const StudentHomePage(),
    const WishListPage(),
    const MyCoursesPage()
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
              label: 'Wish List'),
          CurvedNavigationBarItem(
              child: Image.asset(
                'assets/icons/play.png',
                color: _selectedIndex == 4 ? Colors.white : Colors.black,
              ),
              label: 'My Courses'),
        ],
      ),
      body: NavPages[_selectedIndex],
    );
  }
}
// BottomNavigationBar(
//         selectedItemColor: ColorManager.mainGreen,
//         selectedLabelStyle: const TextStyle(color: ColorManager.mainGreen),
//         selectedIconTheme:
//             const IconThemeData(size: 35, color: ColorManager.mainGreen),
//         selectedFontSize: 13,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         currentIndex: _selectedIndex,
//         elevation: 0,
//         backgroundColor: ColorManager.lightGray,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//               icon: Image.asset('assets/icons/account.png'), label: 'Account',),
//           BottomNavigationBarItem(
//               icon: Image.asset('assets/icons/search.png'), label: 'Search'),
//           BottomNavigationBarItem(
//               icon: Image.asset('assets/icons/home.png'), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Image.asset('assets/icons/star.png'), label: 'Wish List'),
//           BottomNavigationBarItem(
//               icon: Image.asset('assets/icons/play.png'), label: 'My Courses'),
//         ],
//       )