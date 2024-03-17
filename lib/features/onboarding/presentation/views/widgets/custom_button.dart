import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scan_image/constants.dart';
import 'package:scan_image/core/utils/classes/app_routes.dart';
import 'package:scan_image/core/utils/functions/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          minimumSize: const Size(100, 50),
        ),
        onPressed: () async {
          getIt.get<SharedPreferences>().setBool('isStarted', true);
          GoRouter.of(context).push(AppRouter.kHomePage);
        },
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
