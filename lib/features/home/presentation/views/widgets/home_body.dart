import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scan_image/constants.dart';
import 'package:scan_image/core/utils/functions/image_picker_text_extractor.dart';
import 'package:scan_image/features/home/presentation/views/widgets/defualt_image.dart';
import 'package:scan_image/features/home/presentation/views/widgets/scanning_progress.dart';
import 'package:scan_image/features/home/presentation/views/widgets/view_extracted_text.dart';
import 'package:scan_image/features/home/presentation/views/widgets/view_picked_image.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});
  static String extractedText = '';
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool scanning = false;

  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      child: ListView(
        children: [
          pickedImage == null
              ? const DefualtImage()
              : ViewPickedImage(
                  pickedImage: pickedImage!,
                ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: const Size(100, 50),
              ),
              onPressed: () async {
                setState(() {
                  scanning = true;
                });
                String returedText;
                File returedImage;
                (returedText, returedImage) = await imagePickerAndTextExtractor(
                    extractedText: HomeBody.extractedText);
                HomeBody.extractedText = returedText;
                pickedImage = returedImage;

                setState(() {
                  scanning = false;
                });
              },
              child: const Text(
                'Pick Your Image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ScanningProgress(scanning: scanning),
          const SizedBox(
            height: 30,
          ),
          ViewExtractedText(extractedText: HomeBody.extractedText)
        ],
      ),
    );
  }
}
