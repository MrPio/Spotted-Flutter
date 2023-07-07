import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(this.text, {super.key, this.invertStyle = false});

  final bool invertStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        backgroundColor: invertStyle
            ? Palette.scheme.background
            : Palette.scheme.onSecondary,
        shape: RoundedRectangleBorder(
          side: invertStyle
              ? BorderSide(color: Palette.scheme.onSecondary, width: 2)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: Fonts.regular(
            color: invertStyle
                ? Palette.scheme.onSecondary
                : Palette.scheme.onPrimary,
            size: 16),
      ),
    );
  }
}
