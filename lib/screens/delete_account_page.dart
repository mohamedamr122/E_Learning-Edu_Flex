import 'package:flutter/material.dart';

import '../classes/class_color.dart';
import '../components/navigator_button.dart';
import '../components/password.dart';
import '../components/smalltext.dart';
import '../components/textfield.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});
  static const String routeName = 'DeleteAccountPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Delete Account',
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              overflow: TextOverflow.clip,
              'Are you sure you want to delete account ? if you sure .',
              style: TextStyle(
                  color: ColorManager.red,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SmallText(text: 'Email address'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MyTextField(
                obscureText: false,
                validator: null,
                controller: null,
                textHint: 'Email Address',
                icon: null),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SmallText(text: 'password'),
          ),
          const MyPasswordField(
              validator: null,
              controller: null,
              text: 'enter your password here',
              color: ColorManager.lightGray),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () {},
              height: 52,
              width: 242,
              color: const Color(0xffFD5555),
              text: 'Delete')
        ],
      ),
    );
  }
}
