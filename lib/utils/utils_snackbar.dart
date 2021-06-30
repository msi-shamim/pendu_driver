import 'package:flutter/material.dart';

class SnackBarUtils {
  static snackBarMethod({String message, BuildContext context}) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
