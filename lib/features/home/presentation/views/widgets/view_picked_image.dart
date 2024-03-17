import 'dart:io';

import 'package:flutter/material.dart';

class ViewPickedImage extends StatelessWidget {
  const ViewPickedImage({super.key, required this.pickedImage});
  final File pickedImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.grey[300],
        image: DecorationImage(
          image: FileImage(pickedImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
