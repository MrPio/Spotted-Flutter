import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/tags.dart';

class TagItem extends StatelessWidget {
  const TagItem({super.key, required this.tag});

  final Tags tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Palette.red,
      ),
      height: 30,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              tag.icon,
              color: Palette.white,
              size: 20,
            ),
            SizedBox(width: 4),
            Text(
              tag.title,
              style: Fonts.regular(color:Palette.white),
              overflow: TextOverflow.fade,
            )
          ],
        ),
      ),
    );
  }
}
