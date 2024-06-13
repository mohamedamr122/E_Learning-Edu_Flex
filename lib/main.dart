import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';
import 'package:new_eduflex/screens/MyAccountPage/account_page.dart';
import 'package:new_eduflex/screens/MyAccountPage/change_password_page.dart';
import 'package:new_eduflex/screens/SignupPage/choose_signup_page.dart';
import 'package:new_eduflex/screens/course_name_page.dart';
import 'package:new_eduflex/screens/MyAccountPage/delete_account_page.dart';
import 'package:new_eduflex/screens/details_course_buy.dart';
import 'package:new_eduflex/screens/MyAccountPage/edit_page_instructor.dart';
import 'package:new_eduflex/screens/MyAccountPage/edit_page_student.dart';
import 'package:new_eduflex/screens/ForgotPasswordPage/forgot_password_page.dart';
import 'package:new_eduflex/screens/StagesPages/high_school_level_one.dart';
import 'package:new_eduflex/screens/StagesPages/high_school_level_three.dart';
import 'package:new_eduflex/screens/StagesPages/high_school_level_two.dart';
import 'package:new_eduflex/screens/HomePage/instructor_home_page.dart';
import 'package:new_eduflex/screens/SignupPage/instructor_signup_page.dart';
import 'package:new_eduflex/screens/HomePage/layout_instructor_page.dart';
import 'package:new_eduflex/screens/HomePage/layout_student_page.dart';
import 'package:new_eduflex/screens/LoginPage/login_page.dart';
import 'package:new_eduflex/screens/StagesPages/middle_school_level_one.dart';
import 'package:new_eduflex/screens/StagesPages/middle_school_level_three.dart';
import 'package:new_eduflex/screens/StagesPages/middle_school_level_two.dart';
import 'package:new_eduflex/screens/layoutPages/mycourses_page.dart';
import 'package:new_eduflex/screens/ForgotPasswordPage/new_password_page.dart';
import 'package:new_eduflex/screens/PaymentPage/newcard_page.dart';
import 'package:new_eduflex/screens/PaymentPage/payment_page.dart';
import 'package:new_eduflex/screens/StagesPages/primary_stage.dart';
import 'package:new_eduflex/screens/layoutPages/rating_page.dart';
import 'package:new_eduflex/screens/layoutPages/search_page.dart';
import 'package:new_eduflex/screens/MyAccountPage/setting_page.dart';
import 'package:new_eduflex/screens/StagesPages/skills.dart';
import 'package:new_eduflex/screens/splash_screen.dart';
import 'package:new_eduflex/screens/HomePage/student_home_page.dart';
import 'package:new_eduflex/screens/SignupPage/student_signup_page.dart';
import 'package:new_eduflex/screens/layoutPages/subjects.dart';
import 'package:new_eduflex/screens/layoutPages/toprating_page.dart';
import 'package:new_eduflex/screens/StagesPages/university.dart';
import 'package:new_eduflex/screens/UploadPages/upload_course_info.dart';
import 'package:new_eduflex/screens/UploadPages/upload_page.dart';
import 'package:new_eduflex/screens/ForgotPasswordPage/verification_code_page.dart';
import 'package:new_eduflex/screens/layoutPages/wishlist_page.dart';

void main() {
  runApp(const EduFlex());
}

class EduFlex extends StatefulWidget {
  const EduFlex({super.key});

  @override
  State<EduFlex> createState() => _EduFlexState();
}

class _EduFlexState extends State<EduFlex> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AccountPage.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          AccountPage.routeName: (context) => const AccountPage(),
          ChangePasswordPage.routeName: (context) => const ChangePasswordPage(),
          ChooseSignUp.routeName: (context) => const ChooseSignUp(),
          CourseNamePage.routeName: (context) => const CourseNamePage(),
          DeleteAccountPage.routeName: (context) => const DeleteAccountPage(),
          EditPageInstructor.routeName: (context) => const EditPageInstructor(),
          ForgotPassword.routeName: (context) => const ForgotPassword(),
          HighSchoolLevelOnePage.routeName: (context) =>
              const HighSchoolLevelOnePage(),
          HighSchoolLevelTwoPage.routeName: (context) =>
              const HighSchoolLevelTwoPage(),
          HighSchoolLevelThreePage.routeName: (context) =>
              const HighSchoolLevelThreePage(),
          InstructorHomePage.routeName: (context) => const InstructorHomePage(),
          InstructorSignupPage.routeName: (context) =>
              const InstructorSignupPage(),
          LayoutInstructorPage.routeName: (context) =>
              const LayoutInstructorPage(),
          LayoutStudentPage.routeName: (context) => const LayoutStudentPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          MiddleSchoolLevelOnePage.routeName: (context) =>
              const MiddleSchoolLevelOnePage(),
          MiddleSchoolLevelTwoPage.routeName: (context) =>
              const MiddleSchoolLevelTwoPage(),
          MiddleSchoolLevelThreePage.routeName: (context) =>
              const MiddleSchoolLevelThreePage(),
          MyCoursesPage.routeName: (context) => const MyCoursesPage(),
          NewPassword.routeName: (context) => const NewPassword(),
          NewCardPage.routeName: (context) => const NewCardPage(),
          PaymentPage.routeName: (context) => const PaymentPage(),
          PrimaryStagePage.routeName: (context) => const PrimaryStagePage(),
          RatingPage.routeName: (context) => const RatingPage(),
          SearchPage.routeName: (context) => SearchPage(),
          SettingPage.routeName: (context) => const SettingPage(),
          SkillsPage.routeName: (context) => const SkillsPage(),
          StudentHomePage.routeName: (context) => const StudentHomePage(),
          StudentSignupPage.routeName: (context) => const StudentSignupPage(),
          Subjects.routeName: (context) => const Subjects(),
          TopRatingPage.routeName: (context) => const TopRatingPage(),
          UniversityPage.routeName: (context) => const UniversityPage(),
          UploadCourseInfo.routeName: (context) => const UploadCourseInfo(),
          UploadPage.routeName: (context) => const UploadPage(),
          VerificationCode.routeName: (context) => const VerificationCode(),
          WishListPage.routeName: (context) => const WishListPage(),
          DetailsCourseBuy.routeName: (context) => const DetailsCourseBuy(),
          EditPageStudent.routeName: (context) => const EditPageStudent(),
        },
      ),
    );
  }
}
