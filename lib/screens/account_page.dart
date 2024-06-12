import 'package:flutter/material.dart';
import 'package:new_eduflex/screens/payment_page.dart';
import 'package:new_eduflex/screens/setting_page.dart';

import '../constants/class_color.dart';
import '../components/itemsbutton.dart';
import 'edit_page_instructor.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static const String routeName = 'AccountPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Account',
          style: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/images/account_screen/account_image.png'),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Column(
                  children: [
                    Text(
                      'MOHANAD WALEED',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '*****@gmail.com',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                TextButton(
                    onPressed: () =>
                        //if Student => to EditPageStudent
                        //if instructor => to EditPageInstructor
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const EditPageInstructor()),
                        ),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: ColorManager.red,
                          color: ColorManager.red),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ItemButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
            },
            text: 'Payment',
            icon: const Icon(
              Icons.payment_rounded,
              color: ColorManager.mainGreen,
              size: 50,
            ),
          ),
          const Divider(color: Colors.black, height: 50, thickness: 0.5),
          ItemButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
            text: 'Setting',
            icon: const Icon(
              Icons.settings_outlined,
              color: ColorManager.mainGreen,
              size: 50,
            ),
          ),
          const Divider(color: Colors.black, height: 50, thickness: 0.5),
        ],
      ),
    );
  }
}
