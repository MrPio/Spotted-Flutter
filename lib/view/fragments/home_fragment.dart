import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.scheme.background,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Palette.scheme.secondary,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(24))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  Expanded(
                    child: Text(
                      "Spotted",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.clickerScript(
                          color: Palette.scheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
