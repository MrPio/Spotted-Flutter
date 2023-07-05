import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/remote_images.dart';
import 'package:spotted_flutter/managers/account_manager.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment(this.changeIndexCallback, {super.key});

  final Function(int) changeIndexCallback;

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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => widget.changeIndexCallback(3),

                      child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu))),
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
                  GestureDetector(
                    onTap: () => widget.changeIndexCallback(2),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Palette.scheme.background,
                          width: 1.5,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(RemoteImages.AVATAR.url),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    var c=AccountManager().user;
  }
}
