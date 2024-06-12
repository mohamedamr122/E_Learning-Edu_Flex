import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/LoginPage/login_page.dart';
import 'package:new_eduflex/screens/SignupPage/student_signup_page.dart';
import '../../constants/class_color.dart';
import '../../components/maintext.dart';
import '../../components/navigator_button.dart';
import 'instructor_signup_page.dart';

class ChooseSignUp extends StatelessWidget {
  const ChooseSignUp({super.key});
  static const routeName = 'ChooseSignUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 97,
              width: 101,
              child: Image.asset(
                'assets/images/splash_screen/logo1.png',
                height: 91,
              ),
            ),
            const MainText(text: 'Sign Up'),
            const SizedBox(
              height: 100,
            ),
            MyNavigatorButton(
                textColor: Colors.white,
                onTap: () => Navigator.pushReplacementNamed(
                    context, StudentSignupPage.routeName),
                height: 52,
                width: 243,
                color: ColorManager.mainGreen,
                text: 'Student'),
            const SizedBox(
              height: 5,
            ),
            MyNavigatorButton(
                textColor: Colors.white,
                onTap: () => Navigator.pushReplacementNamed(
                    context, InstructorSignupPage.routeName),
                height: 52,
                width: 243,
                color: ColorManager.mainGreen,
                text: 'Instructor'),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have account?',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    TextButton(
                      child: const Text(
                        'log in',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
