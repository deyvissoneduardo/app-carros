import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButtom extends StatelessWidget {
  VoidCallback? onPressed;
  String? text;

  AppButtom({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
