import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';

class Fonts {
  static light({color,double size=15}) => GoogleFonts.lato(
      color: color ??Palette.scheme.onSecondary,
      fontSize: size,
      fontWeight: FontWeight.w300);

  static regular({color,double size=15}) => GoogleFonts.lato(
      color: color ??Palette.scheme.onSecondary,
      fontSize: size,
      fontWeight: FontWeight.normal);

  static bold({color,double size=18}) => GoogleFonts.lato(
      color: color ?? Palette.scheme.onSecondary,
      fontSize: size,
      fontWeight: FontWeight.bold);

  static black({color,double size=24}) => GoogleFonts.lato(
      color: color ??Palette.scheme.onSecondary,
      fontSize: size,
      fontWeight: FontWeight.w900);
}
