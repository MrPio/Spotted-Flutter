import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            const Text(
              introTitle,
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              introSubTitle,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {widget.setIndex(1);},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          start,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
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
