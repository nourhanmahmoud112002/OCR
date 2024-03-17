import 'package:flutter/material.dart';
import 'package:scan_image/core/utils/functions/copy_extracted_text.dart';
import 'package:scan_image/features/home/presentation/views/widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const HomeBody(),
        floatingActionButton: IconButton(
          onPressed: () => copyExtractedTextToClipboard(
              context: context, extractedText: HomeBody.extractedText),
          icon: const Icon(
            Icons.copy,
            size: 38,
          ),
        ),
      ),
    );
  }
}
