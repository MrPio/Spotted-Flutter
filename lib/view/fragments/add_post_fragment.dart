import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/palette.dart';

class AddPostFragment extends StatefulWidget {
  const AddPostFragment(this.changeIndexCallback,{super.key});
  final Function(int) changeIndexCallback;

  @override
  State<AddPostFragment> createState() => _AddPostFragmentState();
}

class _AddPostFragmentState extends State<AddPostFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.scheme.background,
    );  }
}
