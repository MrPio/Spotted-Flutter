import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/model/post.dart';

class LoadingView extends StatefulWidget {
  LoadingView({this.visible = true, super.key});

  bool visible;

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: widget.visible,
        child:
        Container(
          color: Palette.overlayBlack,
          child: const Center(
            child: CircularProgressIndicator(
              color: Palette.white,
            ),
          ),
        )
    );
  }
}
