import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/palette.dart';

class BottomBarIcon extends StatefulWidget {
  const BottomBarIcon(
      {this.icon = Icons.home_outlined,
      this.active = true,
      this.onTap,
      Key? key})
      : super(key: key);

  final IconData icon;
  final bool active;
  final Function? onTap;

  @override
  State<BottomBarIcon> createState() => _BottomBarIconState();
}

class _BottomBarIconState extends State<BottomBarIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: 58,
      child: Stack(
        children: [
          Visibility(
            visible: widget.active,
            child: Center(
              child: Container(
                height: 54,
                width: 54,
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(
                widget.icon,
                size: 28,
                color:
                    widget.active ? Palette.black : Palette.white,
              ),
              onPressed: () => widget.onTap?.call(),
            ),
          ),
        ],
      ),
    );
  }
}
