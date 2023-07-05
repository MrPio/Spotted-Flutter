import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/palette.dart';

class SettingsFragment extends StatefulWidget {
  const SettingsFragment(this.changeIndexCallback,{super.key});
  final Function(int) changeIndexCallback;

  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.scheme.background,
    );
  }
}
