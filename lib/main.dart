import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/ai_services/id_detection/id_detection_cubit.dart';
import 'package:new_eduflex/cubit/Auth/auth_cubit.dart';
import 'package:new_eduflex/screens/ForgotPasswordPage/verification_code_forgot_password_page.dart';
import 'package:new_eduflex/screens/MyAccountPage/account_page.dart';
import 'package:new_eduflex/screens/MyAccountPage/change_password_page.dart';
import 'package:new_eduflex/screens/SignupPage/choose_signup_page.dart';
import 'package:new_eduflex/screens/Play_video_course_page.dart';
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
import 'package:new_eduflex/screens/ForgotPasswordPage/create_new_password_page.dart';
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
import 'package:new_eduflex/shared/local_network.dart';

import 'ai_services/comment_detection/comment_detection_cubit.dart';
import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashNetwork.cashInitialization();
  token = CashNetwork.getCashData(key: 'token');
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CommentDetectionCubit(),
          ),
          BlocProvider(
            create: (context) => IdDetectionCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: InstructorHomePage.routeName,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            AccountPage.routeName: (context) => const AccountPage(),
            ChangePasswordPage.routeName: (context) =>
                const ChangePasswordPage(),
            ChooseSignUpPage.routeName: (context) => const ChooseSignUpPage(),
            PlayVideoCoursePage.routeName: (context) =>
                const PlayVideoCoursePage(),
            DeleteAccountPage.routeName: (context) => const DeleteAccountPage(),
            EditPageInstructor.routeName: (context) =>
                const EditPageInstructor(),
            ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
            HighSchoolLevelOnePage.routeName: (context) =>
                const HighSchoolLevelOnePage(),
            HighSchoolLevelTwoPage.routeName: (context) =>
                const HighSchoolLevelTwoPage(),
            HighSchoolLevelThreePage.routeName: (context) =>
                const HighSchoolLevelThreePage(),
            InstructorHomePage.routeName: (context) =>
                const InstructorHomePage(),
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
            CreateNewPasswordPage.routeName: (context) => const CreateNewPasswordPage(),
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
            UploadFormPage.routeName: (context) => const UploadFormPage(),
            VerificationCodePage.routeName: (context) =>
                const VerificationCodePage(),
            VerificationCodeForgotPasswordPage.routeName: (context) =>
            const VerificationCodeForgotPasswordPage(),
            WishListPage.routeName: (context) => const WishListPage(),
            DetailsCourseBuy.routeName: (context) =>
                const DetailsCourseBuy(comment: ''),
            EditPageStudent.routeName: (context) => const EditPageStudent(),
          },
        ));
  }
}
