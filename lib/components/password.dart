import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  const MyPasswordField({
    super.key,
    required this.text,
    required this.color,
    required this.controller,
    required this.validator,
  });
  final String text;
  final Color color;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: secureText,
      decoration: InputDecoration(
        hintText: widget.text,
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                secureText = !secureText;
              });
            },
            icon: Icon(secureText ? Icons.visibility_off : Icons.visibility)),
        fillColor: widget.color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
