import 'package:flutter/material.dart';

import 'newcard_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment',
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Card Management',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              TextButton(
                style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(0),
                    overlayColor: WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const NewCardPage()),
                  );
                },
                child: const Text(
                  'Add new+',
                  style: TextStyle(
                      color: Color(0xffED0006),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
          const Image(
            image: AssetImage('assets/images/payment_page/Payment failed.png'),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  'You don\'t have any saved payment methods',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff707070)),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  'Add these in at checkout for a smoother',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff717171),
                  ),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  'experience!',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff717171),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
