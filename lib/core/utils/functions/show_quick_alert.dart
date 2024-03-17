import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

showQuickAlert(
    {required BuildContext context,
    required String title,
    required String message,
    required QuickAlertType type,
    required Color color}) {
  QuickAlert.show(
    confirmBtnColor: color,
    confirmBtnText: 'Ok',
    context: context,
    type: type,
    title: title,
    text: message,
  );
}

showsnackbar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
    ),
  );
}
