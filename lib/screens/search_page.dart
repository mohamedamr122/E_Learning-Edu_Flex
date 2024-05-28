import 'package:flutter/material.dart';

import '../classes/class_color.dart';
import '../components/firstcategories.dart';
import '../components/secondcategories.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 58),
        children: [
          Row(
            children: [
              SizedBox(
                width: 266,
                height: 42,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffDFDFDF),
                    disabledBorder: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: ColorManager.forgotGray,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'What are you looking for?',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      color: Color(0xff1D2939)),
                ),
              ),
            ],
          ),
          const FirstCategories(),
          const SecondCategories(),
        ],
      ),
    );
  }
}
