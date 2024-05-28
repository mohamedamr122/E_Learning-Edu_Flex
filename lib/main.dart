import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_eduflex/cubit/auth_cubit.dart';
import 'package:new_eduflex/screens/account_page.dart';
import 'package:new_eduflex/screens/forgot_password_page.dart';
import 'package:new_eduflex/screens/instructor_signup_page.dart';
import 'package:new_eduflex/screens/layout_instructor_page.dart';
import 'package:new_eduflex/screens/layout_student_page.dart';
import 'package:new_eduflex/screens/login_page.dart';
import 'package:new_eduflex/screens/middle_school_level_one.dart';
import 'package:new_eduflex/screens/payment_page.dart';
import 'package:new_eduflex/screens/rating_page.dart';
import 'package:new_eduflex/screens/splash_screen.dart';
import 'package:new_eduflex/screens/student_home_page.dart';
import 'package:new_eduflex/screens/student_signup_page.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
