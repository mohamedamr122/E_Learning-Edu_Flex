import 'package:flutter/material.dart';
import 'package:new_eduflex/components/dropbox.dart';

import '../constants/class_color.dart';
import '../components/navigator_button.dart';
import '../components/password.dart';
import '../components/textfield.dart';
import 'changepassword_page.dart';

class EditPageStudent extends StatefulWidget {
  const EditPageStudent({super.key});
  static const String routeName = 'EditPageStudent';

  @override
  State<EditPageStudent> createState() => _EditPageStudentState();
}

class _EditPageStudentState extends State<EditPageStudent> {
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
                Flexible(
                  child: MyTextField(
                    obscureText: false,
                    validator: null,
                    controller: null,
                    textHint: 'Mohanad',
                    icon: null,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: MyTextField(
                    obscureText: false,
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
                obscureText: false,
                validator: null,
                controller: null,
                textHint: '*****@gmail.com',
                icon: null),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
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
          const SizedBox(
            height: 10,
          ),
          const Text(
            ' Education',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: ColorManager.lightGray,
              border: Border.all(
                color: ColorManager.logGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonFormField(
              dropdownColor: ColorManager.lightGray,
              decoration: const InputDecoration.collapsed(hintText: ''),
              hint: const Text('Select One'),
              items: ['General', 'Special', 'Graduated']
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              value: educationSelected,
              onChanged: (value) {
                setState(() {
                  educationSelected = value!;
                  isDropdownVisible = true;
                });
              },
            ),
          ),
          if (educationSelected == 'General') ...[
            const MyDropBox(
              hintText: 'Stage',
              items: [
                DropdownMenuItem(
                  value: 'Primary level',
                  child: Text('Primary level'),
                ),
                DropdownMenuItem(
                  value: 'Middle school',
                  child: Text('Middle school'),
                ),
                DropdownMenuItem(
                  value: 'High school',
                  child: Text('High school'),
                ),
                DropdownMenuItem(
                  value: 'University',
                  child: Text('University'),
                ),
              ],
            ),
            const MyDropBox(
              hintText: 'Level',
              items: [
                DropdownMenuItem(
                  value: 'Level one',
                  child: Text('Level one'),
                ),
                DropdownMenuItem(
                  value: 'Level two',
                  child: Text('Level two'),
                ),
                DropdownMenuItem(
                  value: 'Level three',
                  child: Text('Level three'),
                ),
              ],
            ),
          ],
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
              },
              height: 42,
              width: 331,
              color: ColorManager.mainGreen,
              text: 'Confirm'),
        ],
      ),
    );
  }
}
