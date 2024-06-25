import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../constants/class_color.dart';
import '../../components/navigator_button.dart';
import '../../components/password.dart';
import '../../components/smalltext.dart';
import '../LoginPage/login_page.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});
  static const String routeName = 'NewPassword';

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  showAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Welcome back! Discover now!',
      title: 'Your password has been changed',
      onConfirmBtnTap: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Create new Password',
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
            padding: EdgeInsets.only(top: 8.0),
            child: SmallText(text: 'New password'),
          ),
          const MyPasswordField(
            validator: null,
            controller: null,
            text: 'Enter your new password',
            color: ColorManager.lightGray,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: SmallText(text: 'Confirm password'),
          ),
          const MyPasswordField(
            validator: null,
            controller: null,
            text: 'Confirm your password',
            color: ColorManager.lightGray,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '*Password must be at least 9 characters 1 uppercase.',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Color(0xffFF0000),
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: MyNavigatorButton(
                  textColor: Colors.white,
                  onTap: () {
                    showAlert();
                  },
                  height: 52,
                  width: 242,
                  color: ColorManager.mainGreen,
                  text: 'Submit'),
            ),
          )
        ],
      ),
    );
  }
}
