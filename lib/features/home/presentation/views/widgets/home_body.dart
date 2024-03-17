import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:scan_image/constants.dart';
import 'package:scan_image/core/utils/functions/show_quick_alert.dart';
import 'package:scan_image/features/home/presentation/manager/cubits/ocr_cubit/ocr_cubit.dart';
import 'package:scan_image/features/home/presentation/views/widgets/defualt_image.dart';
import 'package:scan_image/features/home/presentation/views/widgets/loading_extracted_text.dart';
import 'package:scan_image/features/home/presentation/views/widgets/scanning_progress.dart';
import 'package:scan_image/features/home/presentation/views/widgets/view_extracted_text.dart';
import 'package:scan_image/features/home/presentation/views/widgets/view_picked_image.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool scanning = false;
  String extractedText = '';
  File? pickedImage1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OcrCubit, OcrState>(
      listener: (context, state) {
        if (state is PickImageSuccess) {
          pickedImage1 = state.pickedImage;
        } else if (state is PickImageFailure) {
          showQuickAlert(
              context: context,
              title: 'Error',
              message: state.errorMessage,
              type: QuickAlertType.error,
              color: Colors.red);
        }
        if (state is ExtractedTextSuccess) {
          extractedText = state.extractedText;
        } else if (state is ExtractedTextFailure) {
          extractedText = 'Error extracting text';
          showQuickAlert(
              context: context,
              title: 'Error',
              message: state.errorMessage,
              type: QuickAlertType.error,
              color: Colors.red);
        }
      },
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: ListView(
              children: [
                pickedImage1 == null
                    ? const DefualtImage()
                    : ViewPickedImage(
                        pickedImage: pickedImage1!,
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
                        // extractedText = '';
                        scanning = true;
                      });
                      BlocProvider.of<OcrCubit>(context).pickImage();
                      setState(() {
                        pickedImage1 =
                            BlocProvider.of<OcrCubit>(context).pickedImage;
                        extractedText =
                            BlocProvider.of<OcrCubit>(context).extractedText;
                      });

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
                extractedText == ''
                    ? const LoadingExtractedText()
                    : ViewExtractedText(extractedText: extractedText)
              ],
            ));
      },
    );
  }
}
