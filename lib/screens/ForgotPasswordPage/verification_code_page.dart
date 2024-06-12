import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../constants/class_color.dart';
import '../../components/navigator_button.dart';
import '../../components/verify_box.dart';
import 'new_password_page.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});
  static const String routeName = 'VerificationCode';

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  showAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      text: 'Welcome back! Discover now!',
      title: 'Your code confirmed',
      onConfirmBtnTap: () =>
          Navigator.pushNamed(context, NewPassword.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                  color: ColorManager.logGrey,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 16),
            child: Center(
              child: Text(
                'The code send to your email******@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Roboto',
                  color: ColorManager.forgotGray,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 22),
            child: Form(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: VerifyBox()),
                  Flexible(child: VerifyBox()),
                  Flexible(child: VerifyBox()),
                  Flexible(child: VerifyBox()),
                  Flexible(child: VerifyBox()),
                  Flexible(child: VerifyBox()),
                ],
              ),
            ),
          ),
          const Center(
            child: Text(
              'Resend in 01:00',
              style: TextStyle(
                color: Color(0xff919191),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () => showAlert(),
              height: 52,
              width: 242,
              color: ColorManager.mainGreen,
              text: 'Verify')
        ],
      ),
    );
  }
}
