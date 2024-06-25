import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/class_color.dart';

class VerifyBox extends StatelessWidget {
  const VerifyBox({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.border,
        ),
        color: ColorManager.lightGray,
        borderRadius: BorderRadius.circular(7),
      ),
      height: 49,
      width: 57,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.titleLarge,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
