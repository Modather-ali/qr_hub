import 'package:flutter/material.dart';

SnackBar superSnackBar(
  BuildContext context, {
  required String message,
  Color color = Colors.red,
}) {
  return SnackBar(
    content: Text(
      message,
    ),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    // action: SnackBarAction(
    //   label: "Undo",
    //   onPressed: () {},
    // ),
  );
}
