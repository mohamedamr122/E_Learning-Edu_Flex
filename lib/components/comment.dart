import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.comment,
  });
  final String comment;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 313,
      height: 59,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/details_course/profile.jpg'),
            radius: 45,
          ),
          Container(
            width: 258,
            height: 59,
            decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey),
                    )
                  ],
                ),
                Text(
                  comment,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
