import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_eduflex/classes/class_color.dart';
import 'package:new_eduflex/components/navigator_button.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/course_name_screen/course name.png'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Rating course',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
                color: ColorManager.mainGreen),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, index) => const Icon(
                Icons.star_purple500_sharp,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {
                return;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(16),
            decoration: const BoxDecoration(color: Color(0xffD9D9D9)),
            width: 293,
            height: 193,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'comment',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete_outline_rounded,
                                  color: ColorManager.red,
                                ),
                                Text(
                                  'Delete',
                                  style: TextStyle(color: ColorManager.red),
                                )
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: ColorManager.logGrey,
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(color: ColorManager.logGrey),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Write a comment',
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                        ),
                        fillColor: const Color(0xffD9D9D9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () {},
              height: 42,
              width: 242,
              color: ColorManager.mainGreen,
              text: 'Submit')
        ],
      ),
    );
  }
}
