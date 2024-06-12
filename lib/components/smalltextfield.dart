import 'package:flutter/material.dart';
import 'package:new_eduflex/constants/class_color.dart';

class SmallTextField extends StatelessWidget {
  const SmallTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 142,
      child: TextFormField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black12),
          ),
          filled: true,
          suffixIcon: null,
          fillColor: ColorManager.lightGray,
        ),
      ),
    );
  }
}
