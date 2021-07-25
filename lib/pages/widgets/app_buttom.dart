import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButtom extends StatelessWidget {
  VoidCallback? onPressed;
  String? text;
  bool showProgess;

  AppButtom({
    Key? key,
    required this.onPressed,
    required this.text,
    this.showProgess = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        child: showProgess
            ? Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ))
            : Text(
                text!,
                style: TextStyle(fontSize: 20),
              ),
      ),
    );
  }
}
