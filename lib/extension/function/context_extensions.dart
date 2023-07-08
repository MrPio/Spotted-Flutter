import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';

extension ContextExtensions on BuildContext {
  popup(String title,
      {String? message,
      Widget? child,
        String positiveText = 'OK',
        Function()? positiveCallback,
        String? negativeText,
        Function()? negativeCallback}) {
    showDialog(
      context: this,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Palette.scheme.background,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(title, style: Fonts.bold()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              message == null
                  ? Container()
                  : Text(message, style: Fonts.regular()),
              child == null ? Container() : child,
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                positiveCallback?.call();
                Navigator.pop(this);
              },
              child: Text(positiveText, style: Fonts.bold(size: 16)),
            ),
            negativeText==null?Container():
            TextButton(
              onPressed: () {
                negativeCallback?.call();
                Navigator.pop(this);
              },
              child: Text(negativeText, style: Fonts.bold(size: 16)),
            ),
          ],
        );
      },
    );
  }
}
