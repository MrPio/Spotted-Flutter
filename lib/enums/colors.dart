import 'package:flutter/material.dart';

enum Palette {
  red(Color(0xFFf15450)),
  white(Color(0xFFffffff)),
  grey(Color(0xFFefefef)),
  black(Color(0xFF303030)),
  darkBlack(Color(0xFF181818)),
  overlayBlack(Color(0x60000000)),
  overlayWhite(Color(0x22ffffff));

  final Color color;

  const Palette(this.color);
}
