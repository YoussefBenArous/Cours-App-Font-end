import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double? left;
  final double? right;

  const CustomTitle({
    super.key,
    required this.title,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left ?? 0, right: right ?? 0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xff858597),
        ),
      ),
    );
  }
}
