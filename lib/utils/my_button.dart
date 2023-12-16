import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final Icon icon;
  VoidCallback onPressed;

  MyButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
      color: Theme.of(context).indicatorColor,
      child: Icon(icon.icon),
    );
  }
}
