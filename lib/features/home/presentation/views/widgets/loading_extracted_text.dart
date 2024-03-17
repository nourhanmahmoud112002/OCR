import 'package:flutter/material.dart';
import 'package:scan_image/constants.dart';
import 'package:shimmer/shimmer.dart';

class LoadingExtractedText extends StatelessWidget {
  const LoadingExtractedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(179, 255, 255, 255),
          highlightColor: kPrimaryColor,
          child: const Text(
            "LOADING ....",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
