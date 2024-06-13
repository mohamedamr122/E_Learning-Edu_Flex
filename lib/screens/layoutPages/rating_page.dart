import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_eduflex/constants/class_color.dart';
import 'package:new_eduflex/components/gradient_text.dart';
import 'package:new_eduflex/components/navigator_button.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});
  static const String routeName = 'RatingPage';

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final List<String> _comments = [];
  final TextEditingController _controller = TextEditingController();

  void _addComment(String comment) {
    setState(() {
      _comments.add(comment);
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GradientText(
          text: 'Course Name',
        ),
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        '   Comments',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: _comments.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_comments[index]),
                        );
                      },
                    ),
                  ),
                  Form(
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write a comment',
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (_controller.text.isNotEmpty) {
                              _addComment(_controller.text);
                            }
                          },
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
              onTap: () {
                Navigator.pop(context);
              },
              height: 42,
              width: 242,
              color: ColorManager.mainGreen,
              text: 'Submit')
        ],
      ),
    );
  }
}
