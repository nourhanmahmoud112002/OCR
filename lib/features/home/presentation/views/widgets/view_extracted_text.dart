import 'package:flutter/material.dart';

class ViewExtractedText extends StatelessWidget {
  const ViewExtractedText({super.key, required this.extractedText});
  final String extractedText;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 13, end: 28),
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          return Text(
            textAlign: TextAlign.center,
            extractedText,
            style: TextStyle(
              fontSize: value,
              fontStyle: FontStyle.italic,
            ),
          );
        });
  }
}
