import 'package:flutter/material.dart';
import 'package:new_eduflex/constants/class_color.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.obscureText,
    required this.textHint,
    required this.icon,
    required this.controller,
    required this.validator,
  });
  final String textHint;
  final IconButton? icon;
  final GlobalKey<FormState> formState = GlobalKey();
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: textHint,
        enabled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        filled: true,
        suffixIcon: icon,
        fillColor: ColorManager.lightGray,
      ),
    );
  }
}
