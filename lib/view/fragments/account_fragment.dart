import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/palette.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment(this.changeIndexCallback,{super.key});
  final Function(int) changeIndexCallback;

  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.scheme.background,
    );  }
}
