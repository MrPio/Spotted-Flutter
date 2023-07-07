import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spotted_flutter/enums/fonts.dart';

extension ContextExtensions on BuildContext {
  popup(String title,
      {String? message,
      Widget? child,
      String positiveText = 'OK',
      Function()? positiveCallback}) {
    showDialog(
      context: this,
      builder: (_) {
        return AlertDialog(
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
          ],
        );
      },
    );
  }
}
