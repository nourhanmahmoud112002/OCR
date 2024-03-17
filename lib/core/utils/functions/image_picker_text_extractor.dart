import 'dart:io';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:image_picker/image_picker.dart';

Future<(String extractedText, File pickedImage)> imagePickerAndTextExtractor(
    {required String extractedText}) async {
  File pickedImage;
  ImagePicker imagePicker = ImagePicker();
  final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

  pickedImage = File(image!.path);
  try {
    extractedText = await FlutterTesseractOcr.extractText(pickedImage.path);
  } catch (e) {
    // Handle the exception
    // print('Error extracting text: $e');
    extractedText = 'Error extracting text';
  }

  return (extractedText, pickedImage);
}
