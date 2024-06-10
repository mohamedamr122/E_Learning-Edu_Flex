import 'package:flutter/material.dart';
import 'package:new_eduflex/components/eduflex_logo_text.dart';
import 'package:new_eduflex/components/levels_selected.dart';
import 'package:new_eduflex/screens/high_school_level_one.dart';
import 'package:new_eduflex/screens/high_school_level_three.dart';
import 'package:new_eduflex/screens/high_school_level_two.dart';
import 'package:new_eduflex/screens/middle_school_level_one.dart';
import 'package:new_eduflex/screens/middle_school_level_three.dart';
import 'package:new_eduflex/screens/middle_school_level_two.dart';
import 'package:new_eduflex/screens/payment_page.dart';
import 'package:new_eduflex/screens/primary_stage.dart';
import 'package:new_eduflex/screens/setting_page.dart';
import 'package:new_eduflex/screens/skills.dart';
import 'package:new_eduflex/screens/university.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../classes/class_color.dart';
import '../components/categories.dart';
import '../components/headlinehome.dart';
import '../components/horizentallistview.dart';
import '../components/selected_side_menu.dart';
import '../components/side_menu_drop.dart';
import 'account_page.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});
  static const String routeName = 'StudentHomePage';

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  bool isTaped = false;
  bool isMiddleTap = false;
  bool isHighTap = false;
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      inverse: true,
      type: SideMenuType.slide,
      key: _sideMenuKey,
      background: Colors.white,
      menu: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: Image(
                    image: AssetImage('assets/images/home_screen/LogoHome.png'),
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/home_screen/EduLogo.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            SideMenuDrop(
              mainAxisAlignment: MainAxisAlignment.start,
              icon: Icons.category_rounded,
              onTap: () {
                setState(() {
                  isTaped = !isTaped;
                });
              },
              text: 'Categories',
            ),
            const SizedBox(
              height: 5,
            ),
            if (isTaped)
              Column(
                children: [
                  SelectedItemSideMenu(
                      text: 'Primary Stage',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const PrimaryStagePage()),
                        );
                      }),
                  SelectedItemSideMenu(
                    text: 'Middle School',
                    onPressed: () {
                      setState(() {
                        isMiddleTap = !isMiddleTap;
                      });
                    },
                  ),
                  if (isMiddleTap)
                    Column(
                      children: [
                        LevelsSelected(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MiddleSchoolLevelOnePage()),
                            );
                          },
                          text: 'Level One',
                        ),
                        LevelsSelected(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MiddleSchoolLevelTwoPage()),
                            );
                          },
                          text: 'Level Two',
                        ),
                        LevelsSelected(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MiddleSchoolLevelThreePage()),
                            );
                          },
                          text: 'Level Three',
                        )
                      ],
                    ),
                  SelectedItemSideMenu(
                    text: 'High school',
                    onPressed: () {
                      setState(() {
                        isHighTap = !isHighTap;
                      });
                    },
                  ),
                  if (isHighTap)
                    Column(
                      children: [
                        LevelsSelected(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HighSchoolLevelOnePage()),
                            );
                          },
                          text: 'Level One',
                        ),
                        LevelsSelected(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HighSchoolLevelTwoPage()),
                            );
                          },
                          text: 'Level Two',
                        ),
                        LevelsSelected(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HighSchoolLevelThreePage()),
                            );
                          },
                          text: 'Level Three',
                        )
                      ],
                    ),
                  SelectedItemSideMenu(
                    text: 'University',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const UniversityPage()),
                      );
                    },
                  ),
                  SelectedItemSideMenu(
                    text: 'Skills',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const SkillsPage()),
                      );
                    },
                  ),
                ],
              ),
            const SizedBox(
              height: 30,
            ),
            SideMenuDrop(
              mainAxisAlignment: MainAxisAlignment.start,
              icon: Icons.settings_rounded,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                );
              },
              text: 'Setting',
            ),
            const SizedBox(
              height: 30,
            ),
            SideMenuDrop(
              mainAxisAlignment: MainAxisAlignment.start,
              icon: Icons.help_outline_rounded,
              onTap: () {},
              text: 'Help',
            ),
            const SizedBox(
              height: 60,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff00BF63),
                    Color(0xffF2F2F2),
                    Color(0xff505050),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Wrap(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.account_circle,
                              size: 40,
                            ),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const AccountPage()),
                            ),
                            color: const Color(0xff434343),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Hi\nMohanad',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF263238),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage(
                            'assets/images/home_screen/LogoHome.png'),
                      ),
                      EduFlexLogo(),
                    ],
                  ),
                  Wrap(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, PaymentPage.routeName);
                            },
                            icon: Image.asset(
                              'assets/icons/Shopping.png',
                              width: 26,
                              height: 26,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              final state = _sideMenuKey.currentState;
                              if (state!.isOpened) {
                                state.closeSideMenu();
                              } else {
                                state.openSideMenu();
                              }
                            },
                            icon: const Icon(Icons.menu),
                            color: Colors.black,
                            iconSize: 35,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              textAlign: TextAlign.center,
              '"Welcome to our exceptional educational courses application"',
              style: TextStyle(
                color: ColorManager.mainGreen,
                fontSize: 11.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                textAlign: TextAlign.center,
                'where knowledge meets motivation! Explore a wide range of exciting courses covering various fields, and embark on your journey to achieve your educational goals with seasoned experts.',
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Divider(
              thickness: 1.5,
              color: Color(0xFF757575),
              endIndent: 50,
              indent: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: HeadLineText(text: 'Top Courses in our application'),
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFF00BF63),
              endIndent: 175,
              indent: 55,
            ),
            const ListViewHorizntal(),
            const Divider(
              thickness: 1.5,
              color: Color(0xFF757575),
              endIndent: 50,
              indent: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: HeadLineText(text: 'Categories'),
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFF00BF63),
              endIndent: 315,
              indent: 25,
            ),
            const Categories(),
            const Divider(
              thickness: 2,
              color: Color(0xFF757575),
              endIndent: 50,
              indent: 50,
            ),
            const Center(child: HeadLineText(text: 'Start to be like them')),
            const Divider(
              thickness: 2,
              color: Color(0xFF00BF63),
              endIndent: 150,
              indent: 150,
            ),
            SizedBox(
              height: 250,
              child: ListView(
                padding: const EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset('assets/images/home_screen/zewail.png'),
                  Image.asset('assets/images/home_screen/zewail.png'),
                  Image.asset('assets/images/home_screen/zewail.png'),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFF757575),
              endIndent: 50,
              indent: 50,
            ),
            const Center(
              child: HeadLineText(text: 'Top Rating instructor'),
            ),
            const Divider(
              height: 25,
              thickness: 2,
              color: Color(0xFF00BF63),
              endIndent: 150,
              indent: 150,
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image(
                        image:
                            AssetImage('assets/images/home_screen/Image.png')),
                    Text('DR:yara')
                  ],
                ),
                Column(
                  children: [
                    Image(
                        image:
                            AssetImage('assets/images/home_screen/Image.png')),
                    Text('DR:mohand')
                  ],
                ),
                Column(
                  children: [
                    Image(
                        image:
                            AssetImage('assets/images/home_screen/Image.png')),
                    Text('DR:hassan')
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image(
                        image:
                            AssetImage('assets/images/home_screen/Image.png')),
                    Text('DR:nabil')
                  ],
                ),
                Column(
                  children: [
                    Image(
                        image:
                            AssetImage('assets/images/home_screen/Image.png')),
                    Text('DR:Rahab   ')
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                        image:
                            AssetImage('assets/images/home_screen/Image.png')),
                    Text('DR:nadia')
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
