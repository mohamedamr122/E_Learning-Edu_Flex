import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_eduflex/constants/class_color.dart';
import 'package:new_eduflex/components/comment.dart';
import 'package:new_eduflex/components/navigator_button.dart';
import 'package:new_eduflex/screens/newcard_page.dart';
import 'package:new_eduflex/screens/payment_page.dart';

class DetailsCourseBuy extends StatelessWidget {
  const DetailsCourseBuy({super.key});
  static const String routeName = 'DetailsCourseBuy';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PaymentPage.routeName);
            },
            child: Image.asset(
              'assets/icons/Shopping.png',
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/details_course/video.png',
                width: 331,
                height: 194,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  size: 150,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'NAME OF COURSE:',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5,
          ),
          RatingBar.builder(
            itemSize: 20,
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, index) => const Icon(
              Icons.star_purple500_sharp,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              return;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'details complete introduction to data science and machine learrnning',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Education :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Stage :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Level :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Term :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Subject :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Course availability :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Language :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Price :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          MyNavigatorButton(
              textColor: Colors.white,
              onTap: () {
                Navigator.pushNamed(context, NewCardPage.routeName);
              },
              height: 42,
              width: 331,
              color: ColorManager.mainGreen,
              text: 'Buy now'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyNavigatorButton(
                  textColor: Colors.white,
                  onTap: () {},
                  height: 40,
                  width: 153,
                  color: const Color(0xff888888),
                  text: 'Add to Wishlist'),
              MyNavigatorButton(
                  textColor: Colors.white,
                  onTap: () {},
                  height: 40,
                  width: 153,
                  color: const Color(0xff888888),
                  text: 'Add to Cart'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Comment(),
          const SizedBox(
            height: 10,
          ),
          const Comment(),
          const SizedBox(
            height: 10,
          ),
          const Comment()
        ],
      ),
    );
  }
}
