import 'package:flutter/material.dart';

import '../classes/class_color.dart';
import '../components/headlinehome.dart';
import '../components/navigator_button.dart';
import '../components/password.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Change Password',
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          HeadLineText(text: 'Current password'),
          const SizedBox(
            height: 8,
          ),
          MyPasswordField(
            validator: null,
            controller: null,
            text: '@#@#',
            color: Colors.white,
          ),
          const SizedBox(
            height: 16,
          ),
          HeadLineText(text: 'New password'),
          const SizedBox(
            height: 8,
          ),
          MyPasswordField(
            validator: null,
            controller: null,
            text: '',
            color: Colors.white,
          ),
          const SizedBox(
            height: 16,
          ),
          HeadLineText(text: 'Confirm password'),
          const SizedBox(
            height: 8,
          ),
          MyPasswordField(
            validator: null,
            controller: null,
            text: '',
            color: Colors.white,
          ),
          const SizedBox(
            height: 16,
          ),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () {},
              height: 42,
              width: 331,
              color: ColorManager.mainGreen,
              text: 'Confirm'),
          MyNavigatorButton(
              textColor: ColorManager.forgotGray,
              onTap: () {},
              height: 42,
              width: 331,
              color: Colors.white,
              text: 'Cancel'),
        ],
      ),
    );
  }
}
