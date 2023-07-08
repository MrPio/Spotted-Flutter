import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/palette.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsetsDirectional.only(start: 24, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Palette.white.withOpacity(0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: Icon(Icons.chevron_left_rounded, color: Palette.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
