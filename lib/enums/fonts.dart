import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';

class Fonts {
  static light([color]) => GoogleFonts.lato(
      color: color ??Palette.scheme.onPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w200);

  static regular([color]) => GoogleFonts.lato(
      color: color ??Palette.scheme.onPrimary,
      fontSize: 14,
      fontWeight: FontWeight.normal);

  static bold([color]) => GoogleFonts.lato(
      color: color ?? Palette.scheme.onPrimary,
      fontSize: 16,
      fontWeight: FontWeight.bold);

  static black([color]) => GoogleFonts.lato(
      color: color ??Palette.scheme.onPrimary,
      fontSize: 22,
      fontWeight: FontWeight.w900);
}
