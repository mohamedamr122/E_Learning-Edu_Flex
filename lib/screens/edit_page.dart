import 'package:flutter/material.dart';

import '../classes/class_color.dart';
import '../components/navigator_button.dart';
import '../components/password.dart';
import '../components/textfield.dart';
import 'changepassword_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  String? educationSelected;
  String? levelSelected;
  String? gradeSelected;
  bool isDropdownVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit',
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    validator: null,
                    controller: null,
                    textHint: 'Mohanad',
                    icon: null,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MyTextField(
                    validator: null,
                    controller: null,
                    textHint: 'Waleed',
                    icon: null,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MyTextField(
                validator: null,
                controller: null,
                textHint: '*****@gmail.com',
                icon: null),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MyPasswordField(
              validator: null,
              controller: null,
              text: '********************',
              color: ColorManager.lightGray,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage()),
            ),
            child: const Text(
              'change password?',
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: ColorManager.forgotGray,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: ColorManager.forgotGray,
              ),
            ),
          ),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () {},
              height: 42,
              width: 331,
              color: ColorManager.mainGreen,
              text: 'Confirm'),
        ],
      ),
    );
  }
}
