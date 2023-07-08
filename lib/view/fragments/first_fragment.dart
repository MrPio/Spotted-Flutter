import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/view/first_page.dart';
import '../../enums/palette.dart';
import '../../enums/strings.dart';
import 'login_fragment.dart';

class FirstFragment extends StatefulWidget {
  final void Function(int) setIndex;

  FirstFragment({required this.setIndex});

  @override
  State<FirstFragment> createState() => _FirstFragmentState();
}

class _FirstFragmentState extends State<FirstFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 60),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            introTitle,
            style: Fonts.black(color: Palette.white, size: 32),
          ),
          const SizedBox(height: 10),
          Text(
            introSubTitle,
            style: Fonts.light(color: Palette.white, size: 20),
          ),
          const SizedBox(height: 54),
          ElevatedButton(
            onPressed: () {
              widget.setIndex(1);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      start,
                      textAlign: TextAlign.center,
                      style: Fonts.regular(color: Palette.white, size: 16),
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
