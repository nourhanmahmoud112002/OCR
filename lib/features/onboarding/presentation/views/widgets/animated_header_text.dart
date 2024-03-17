import 'package:flutter/material.dart';
import 'package:scan_image/constants.dart';

class AnimatedHeaderText extends StatelessWidget {
  const AnimatedHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 13, end: 28),
        duration: const Duration(seconds: 2),
        builder: (context, value, child) {
          return Text(
            textAlign: TextAlign.center,
            onboarding1,
            style: TextStyle(fontSize: value, fontWeight: FontWeight.w500),
          );
        });
  }
}
