import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';

class Fonts {
  static light({color,double? size}) => GoogleFonts.lato(
      color: color ??Palette.scheme.onSecondary,
      fontSize: size??14,
      fontWeight: FontWeight.w300);

  static regular({color,double? size}) => GoogleFonts.lato(
      color: color ??Palette.scheme.onSecondary,
      fontSize: size??14,
      fontWeight: FontWeight.normal);

  static bold({color,double? size}) => GoogleFonts.lato(
      color: color ?? Palette.scheme.onSecondary,
      fontSize: size??18,
      fontWeight: FontWeight.bold);

  static black({color,double? size}) => GoogleFonts.lato(
      color: color ??Palette.scheme.onSecondary,
      fontSize: size??24,
      fontWeight: FontWeight.w900);
}
