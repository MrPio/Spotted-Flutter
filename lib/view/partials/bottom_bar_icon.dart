import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/colors.dart';

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
      height: 60,
      width: 60,
      child: Stack(
        children: [
          Visibility(
            visible: widget.active,
            child: Center(
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Palette.white.color,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(
                widget.icon,
                size: 30,
                color:
                    widget.active ? Palette.black.color : Palette.white.color,
              ),
              onPressed: () => widget.onTap?.call(),
            ),
          ),
        ],
      ),
    );
  }
}
