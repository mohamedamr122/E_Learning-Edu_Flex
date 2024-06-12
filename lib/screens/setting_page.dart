import 'package:flutter/material.dart';

import '../constants/class_color.dart';
import '../components/dropbox.dart';
import '../components/navigator_button.dart';
import 'delete_account_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  static const String routeName = 'SettingPage';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Setting',
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const MyDropBox(items: [
            DropdownMenuItem(
              value: 'Egypt',
              child: Text('Egypt'),
            ),
            DropdownMenuItem(
              value: 'Morocco',
              child: Text('Morocco'),
            ),
            DropdownMenuItem(
              value: 'Sudan',
              child: Text('Sudan'),
            )
          ], hintText: 'Country'),
          const MyDropBox(items: [
            DropdownMenuItem(
              value: 'AR',
              child: Text('AR'),
            ),
            DropdownMenuItem(
              value: 'EN',
              child: Text('EN'),
            ),
            DropdownMenuItem(
              value: 'FR',
              child: Text('FR'),
            )
          ], hintText: 'language'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notifaction',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              Switch(
                  trackOutlineColor: const WidgetStatePropertyAll(Colors.white),
                  inactiveTrackColor: ColorManager.lightGray,
                  activeColor: ColorManager.mainGreen,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  })
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.white)),
                child: const Text(
                  'Delete Account',
                  style: TextStyle(
                      color: ColorManager.red,
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DeleteAccountPage()));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () {},
              height: 41,
              width: 345,
              color: ColorManager.mainGreen,
              text: 'CONFIRM')
        ],
      ),
    );
  }
}
