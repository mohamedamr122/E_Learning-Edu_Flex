import 'package:flutter/material.dart';

import '../constants/class_color.dart';

// ignore: must_be_immutable
class SideMenuDrop extends StatefulWidget {
  SideMenuDrop(
      {super.key,
      required this.text,
      required this.onTap,
      required this.icon,
      required this.mainAxisAlignment});
  String text;
  void Function()? onTap;
  IconData? icon;
  MainAxisAlignment mainAxisAlignment;

  @override
  State<SideMenuDrop> createState() => _SideMenuDropState();
}

class _SideMenuDropState extends State<SideMenuDrop> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: [
          Icon(
            widget.icon,
            color: ColorManager.mainGreen,
            size: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            widget.text,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff272727),
            ),
          ),
        ],
      ),
    );
  }
}
