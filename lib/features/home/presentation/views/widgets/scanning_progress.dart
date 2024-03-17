import 'package:flutter/material.dart';
import 'package:scan_image/constants.dart';

class ScanningProgress extends StatelessWidget {
  const ScanningProgress({super.key, required this.scanning});
  final bool scanning;
  @override
  Widget build(BuildContext context) {
    return scanning
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : const Center(
            child: Icon(
              Icons.done,
              color: kPrimaryColor,
              size: 30,
            ),
          );
  }
}
