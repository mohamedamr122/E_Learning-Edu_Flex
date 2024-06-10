import 'package:flutter/material.dart';
import 'package:new_eduflex/components/eduflex_logo_text.dart';

import '../components/course_photo.dart';
import 'account_page.dart';

class InstructorHomePage extends StatelessWidget {
  const InstructorHomePage({super.key});
  static const String routeName = 'InstructorHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
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
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.account_circle,
                        size: 35,
                      ),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const AccountPage()),
                      ),
                      color: const Color(0xff434343),
                    ),
                    const Text(
                      'Hi\nMohanad',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF263238),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/images/home_screen/LogoHome.png'),
                        ),
                        EduFlexLogo()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverGrid.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return const CoursePhoto();
              },
            ),
          ],
        ),
      ),
    );
  }
}
