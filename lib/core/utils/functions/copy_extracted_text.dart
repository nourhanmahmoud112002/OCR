import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:scan_image/core/utils/functions/show_quick_alert.dart';

copyExtractedTextToClipboard(
    {required String extractedText, required BuildContext context}) {
  if (extractedText.isEmpty) {
    showQuickAlert(
        color: Colors.red,
        context: context,
        title: 'Error',
        message: 'No text found',
        type: QuickAlertType.error);
  } else {
    Clipboard.setData(ClipboardData(text: extractedText));
    // showQuickAlert(
    //     color: kPrimaryColor,
    //     context: context,
    //     title: 'Success',
    //     message: 'Text copied Successfully',
    //     type: QuickAlertType.success);
    showsnackbar(context: context, message: 'Text copied Successfully');
  }
}
