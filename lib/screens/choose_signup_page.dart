import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/student_signup_page.dart';
import '../classes/class_color.dart';
import '../components/maintext.dart';
import '../components/navigator_button.dart';
import 'instructor_signup_page.dart';

class ChooseSignUp extends StatelessWidget {
  const ChooseSignUp({super.key});
    static const routeName = 'ChooseSignUp';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
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
            height: 50,
          ),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const StudentSignupPage()),
                  ),
              height: 52,
              width: 243,
              color: ColorManager.mainGreen,
              text: 'Student'),
          const SizedBox(
            height: 5,
          ),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const InstructorSignupPage()),
                  ),
              height: 52,
              width: 243,
              color: ColorManager.mainGreen,
              text: 'Instructor'),
        ],
      ),
    );
  }
}
