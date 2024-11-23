import 'package:flutter/material.dart';

class CustomTitre extends StatelessWidget {
  final String text;
  final Color color;

  const CustomTitre({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
