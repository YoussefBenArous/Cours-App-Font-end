import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Color backgroundColor;

  const CustomPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 57,
          right: 57,
          top: 112,
        ), // Increase top padding to move content higher
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          // Align content towards the top
          crossAxisAlignment:
              CrossAxisAlignment.center, // Center content horizontally
          children: [
            Image.asset(
              imagePath,
              height: 260,
              width: 260,
            ),
            const SizedBox(height: 20), // Space between image and title
            Text(
              title,
              textAlign: TextAlign.center, // Center the text
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20), // Space between title and description
            Text(
              description,
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
