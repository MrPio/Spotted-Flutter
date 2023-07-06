import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';

class Fonts {
  static light([color]) => GoogleFonts.lato(
      color: color ??Palette.scheme.onSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w300);

  static regular([color]) => GoogleFonts.lato(
      color: color ??Palette.scheme.onSecondary,
      fontSize: 14,
      fontWeight: FontWeight.normal);

  static bold([color]) => GoogleFonts.lato(
      color: color ?? Palette.scheme.onSecondary,
      fontSize: 18,
      fontWeight: FontWeight.bold);

  static black([color]) => GoogleFonts.lato(
      color: color ??Palette.scheme.onSecondary,
      fontSize: 24,
      fontWeight: FontWeight.w900);
}
