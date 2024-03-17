import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:scan_image/core/utils/functions/show_quick_alert.dart';

part 'ocr_state.dart';

class OcrCubit extends Cubit<OcrState> {
  OcrCubit() : super(PickImageInitial());

  File? pickedImage;
  String extractedText = '';
  bool isStarted = false;
  Future<void> pickImage() async {
    extractedText = '';
    emit(PickImageLoading());
    try {
      ImagePicker imagePicker = ImagePicker();
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.gallery);

      pickedImage = File(image!.path);
      emit(PickImageSuccess(pickedImage: pickedImage!));
      imagePickerAndTextExtractor(pickedImage: pickedImage!);
    } catch (e) {
      emit(PickImageFailure(errorMessage: e.toString()));
    }
  }

  Future<void> imagePickerAndTextExtractor({required File pickedImage}) async {
    emit(ExtractedTextLoading());
    try {
      extractedText = await FlutterTesseractOcr.extractText(pickedImage.path,
          language: 'eng+ara');
      if (extractedText == '') {
        extractedText = 'No text found';
      }
      emit(ExtractedTextSuccess(extractedText: extractedText));
    } catch (e) {
      extractedText = 'Error extracting text';
      emit(ExtractedTextFailure(errorMessage: e.toString()));
    }
  }

  copyExtractedTextToClipboard({required BuildContext context}) {
    if (extractedText.isEmpty || extractedText == 'No text found') {
      showQuickAlert(
          color: Colors.red,
          context: context,
          title: 'Error',
          message: 'No text found',
          type: QuickAlertType.error);
    } else {
      Clipboard.setData(ClipboardData(text: extractedText));
      showsnackbar(context: context, message: 'Text copied Successfully');
    }
  }
}
