import 'package:flutter/material.dart';
import '../../enums/palette.dart';
import '../../enums/strings.dart';

class FirstFragment extends StatefulWidget {
  const FirstFragment({super.key});

  @override
  State<FirstFragment> createState() => _FirstFragmentState();
}

class _FirstFragmentState extends State<FirstFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 60),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
            Stack(
              alignment: Alignment.centerRight,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Azione da eseguire quando il pulsante viene premuto
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        start,
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
