import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/remote_images.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/model/post.dart';
import 'package:spotted_flutter/view/partials/loading_view.dart';
import 'package:spotted_flutter/view/partials/spot_post.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment(this.changeIndexCallback, {super.key});

  final Function(int) changeIndexCallback;

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List<Post> posts = [
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post(),
    Post()
  ];
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Palette.scheme.background,
          child: Column(
            children: [
              // Header
              Container(
                decoration: BoxDecoration(
                    color: Palette.scheme.secondary,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(24))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            splashRadius: 30,
                            onPressed: () => widget.changeIndexCallback(3),
                            icon: const Icon(Icons.menu),
                          ),
                        ),
                      ),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                              backgroundImage:
                                  NetworkImage(RemoteImages.AVATAR.url),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Posts list
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: posts.length,
                  itemBuilder: (context, i) => SpotPost(post: posts[i]),
                  padding: const EdgeInsets.only(bottom: 120),
                ),
              ),
            ],
          ),
        ),
        LoadingView(
          visible: isLoading,
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
