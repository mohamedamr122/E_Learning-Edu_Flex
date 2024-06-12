import 'package:flutter/material.dart';

import '../constants/class_color.dart';
import '../components/categories.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  static const String routeName = 'SearchPage';
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 58),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 266,
                height: 42,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorManager.lightGray,
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
                onPressed: () {
                  searchController.clear();
                },
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
          const SizedBox(
            height: 10,
          ),
          const Categories(),
        ],
      ),
    );
  }
}
