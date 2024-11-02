import 'package:flutter/material.dart';

class CustomTitre extends StatelessWidget {
  final String text;
  const CustomTitre({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xff1f1f39),
      ),
    );
  }
}
