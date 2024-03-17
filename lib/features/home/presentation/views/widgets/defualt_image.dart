import 'package:flutter/material.dart';

class DefualtImage extends StatelessWidget {
  const DefualtImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.grey[300],
        image: const DecorationImage(
            image: AssetImage('assets/images/defualt_image.png'),
            fit: BoxFit.fill),
      ),
      height: 300,
    );
  }
}
