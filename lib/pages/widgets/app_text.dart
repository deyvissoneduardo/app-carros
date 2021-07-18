import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  String label;
  String hint;
  bool obscureText = false;
  TextEditingController controller;
  FormFieldValidator<String>? validator;

  AppText({
    Key? key,
    required this.label,
    required this.hint,
    required this.obscureText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
        hintText: hint,
      ),
    );
  }
}
