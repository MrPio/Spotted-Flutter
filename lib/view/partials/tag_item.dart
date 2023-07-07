import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/tags.dart';

class TagItem extends StatefulWidget {
  const TagItem({super.key, required this.tag, this.selected = true, this.onTap});

  final Tags tag;
  final bool selected;
  final Function()? onTap;

  @override
  State<TagItem> createState() => _TagItemState();
}

class _TagItemState extends State<TagItem> {
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: Palette.red,
            width: widget.selected ? 0 : 2,
          ),
          color: widget.selected ? Palette.red : Colors.transparent,
        ),
        clipBehavior: Clip.antiAlias,
        height: 30,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap??(){},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    widget.tag.icon,
                    color:  widget.selected? Palette.white:Palette.scheme.onSecondary,
                    size: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    widget.tag.title,
                    style: Fonts.regular(color: widget.selected? Palette.white:Palette.scheme.onSecondary),
                    overflow: TextOverflow.fade,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
