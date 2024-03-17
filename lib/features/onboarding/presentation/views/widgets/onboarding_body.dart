import 'package:flutter/material.dart';
import 'package:scan_image/constants.dart';
import 'package:scan_image/features/onboarding/presentation/views/widgets/animated_header_text.dart';
import 'package:scan_image/features/onboarding/presentation/views/widgets/custom_button.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(
        height: 32,
      ),
      Image.asset(
        height: 250,
        width: 250,
        'assets/images/Image_folder.png',
      ),
      const SizedBox(
        height: 32,
      ),
      const AnimatedHeaderText(),
      const SizedBox(
        height: 5,
      ),
      const Text(
        textAlign: TextAlign.center,
        onboarding2,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      const SizedBox(
        height: 50,
      ),
      const CustomButton(),
    ]);
  }
}
