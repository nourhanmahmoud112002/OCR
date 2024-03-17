import 'package:flutter/material.dart';
import 'package:scan_image/features/onboarding/presentation/views/widgets/onboarding_body.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: OnBoardingBody(),
      ),
    );
  }
}
