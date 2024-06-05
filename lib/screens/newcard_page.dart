import 'package:flutter/material.dart';

import '../classes/class_color.dart';
import '../components/navigator_button.dart';
import '../components/smalltextfield.dart';
import '../components/textfield.dart';

class NewCardPage extends StatelessWidget {
  const NewCardPage({super.key});
  static const String routeName = 'NewCardPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add new card',
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ClipRRect(
            child: Image(
                image: AssetImage('assets/images/newcard_screen/card.png')),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(
                    'assets/images/newcard_screen/Method=PayPal.png'),
              ),
              Image(
                image:
                    AssetImage('assets/images/newcard_screen/Method=Visa.png'),
              ),
              Image(
                image: AssetImage(
                    'assets/images/newcard_screen/Method=Mastercard.png'),
              ),
              Image(
                image: AssetImage(
                    'assets/images/newcard_screen/Method=Alipay.png'),
              ),
              Image(
                image:
                    AssetImage('assets/images/newcard_screen/Method=Amex.png'),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Cardholder Name',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xff4B4B4B),
              ),
            ),
          ),
          MyTextField(
              obscureText: false,
              validator: null,
              controller: null,
              textHint: '',
              icon: null),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Card Number',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xff4B4B4B),
              ),
            ),
          ),
          MyTextField(
              obscureText: false,
              validator: null,
              controller: null,
              textHint: '',
              icon: null),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Card Number',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff4B4B4B),
                      ),
                    ),
                  ),
                  SmallTextField()
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'CVV',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff4B4B4B),
                      ),
                    ),
                  ),
                  SmallTextField()
                ],
              ),
            ],
          ),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () {},
              height: 41,
              width: 345,
              color: ColorManager.mainGreen,
              text: 'Add card')
        ],
      ),
    );
  }
}
