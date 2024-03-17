import 'package:flutter/material.dart';

class ViewExtractedText extends StatelessWidget {
  const ViewExtractedText({super.key, required this.extractedText});
  final String extractedText;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      extractedText,
      style: const TextStyle(
        fontSize: 28,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
