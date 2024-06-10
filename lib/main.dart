import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';
import 'package:new_eduflex/screens/account_page.dart';
import 'package:new_eduflex/screens/changepassword_page.dart';
import 'package:new_eduflex/screens/choose_signup_page.dart';
import 'package:new_eduflex/screens/course_name_page.dart';
import 'package:new_eduflex/screens/delete_account_page.dart';
import 'package:new_eduflex/screens/details_course_buy.dart';
import 'package:new_eduflex/screens/edit_page.dart';
import 'package:new_eduflex/screens/forgot_password_page.dart';
import 'package:new_eduflex/screens/high_school_level_one.dart';
import 'package:new_eduflex/screens/high_school_level_three.dart';
import 'package:new_eduflex/screens/high_school_level_two.dart';
import 'package:new_eduflex/screens/instructor_home_page.dart';
import 'package:new_eduflex/screens/instructor_signup_page.dart';
import 'package:new_eduflex/screens/layout_instructor_page.dart';
import 'package:new_eduflex/screens/layout_student_page.dart';
import 'package:new_eduflex/screens/login_page.dart';
import 'package:new_eduflex/screens/middle_school_level_one.dart';
import 'package:new_eduflex/screens/middle_school_level_three.dart';
import 'package:new_eduflex/screens/middle_school_level_two.dart';
import 'package:new_eduflex/screens/mycourses_page.dart';
import 'package:new_eduflex/screens/new_password_page.dart';
import 'package:new_eduflex/screens/newcard_page.dart';
import 'package:new_eduflex/screens/payment_page.dart';
import 'package:new_eduflex/screens/primary_stage.dart';
import 'package:new_eduflex/screens/rating_page.dart';
import 'package:new_eduflex/screens/search_page.dart';
import 'package:new_eduflex/screens/setting_page.dart';
import 'package:new_eduflex/screens/skills.dart';
import 'package:new_eduflex/screens/splash_screen.dart';
import 'package:new_eduflex/screens/student_home_page.dart';
import 'package:new_eduflex/screens/student_signup_page.dart';
import 'package:new_eduflex/screens/subjects.dart';
import 'package:new_eduflex/screens/toprating_page.dart';
import 'package:new_eduflex/screens/university.dart';
import 'package:new_eduflex/screens/upload_course_videos.dart';
import 'package:new_eduflex/screens/upload_page.dart';
import 'package:new_eduflex/screens/verification_code_page.dart';
import 'package:new_eduflex/screens/wishlist_page.dart';

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
        initialRoute: DetailsCourseBuy.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          AccountPage.routeName: (context) => const AccountPage(),
          ChangePasswordPage.routeName: (context) => const ChangePasswordPage(),
          ChooseSignUp.routeName: (context) => const ChooseSignUp(),
          CourseNamePage.routeName: (context) => const CourseNamePage(),
          DeleteAccountPage.routeName: (context) => const DeleteAccountPage(),
          EditPage.routeName: (context) => const EditPage(),
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
          UploadCourseVideos.routeName: (context) => const UploadCourseVideos(),
          UploadPage.routeName: (context) => const UploadPage(),
          VerificationCode.routeName: (context) => const VerificationCode(),
          WishListPage.routeName: (context) => const WishListPage(),
          DetailsCourseBuy.routeName: (context) => const DetailsCourseBuy(),
        },
      ),
    );
  }
}
