import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/locations.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/tags.dart';
import 'package:spotted_flutter/model/post.dart';
import 'package:spotted_flutter/view/partials/loading_view.dart';
import 'package:spotted_flutter/view/partials/rounded_button.dart';
import 'package:spotted_flutter/view/partials/tag_item.dart';

class AddPostFragment extends StatefulWidget {
  const AddPostFragment(this.changeIndexCallback, {super.key});

  final Function(int) changeIndexCallback;

  @override
  State<AddPostFragment> createState() => _AddPostFragmentState();
}

class _AddPostFragmentState extends State<AddPostFragment> {
  Post post = Post();
  bool isLoading = false;
  final contentController = ScrollController();
  var imageOpacity = 1.0;
  var imageScale = 1.05;

  get tags => List<Tags?>.of([null]) + (post.tags);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Palette.scheme.background,
          child: isLoading
              ? LoadingView()
              : Stack(
                  children: [
                    // BG image
                    Container(
                      color: Palette.scheme.surface,
                      height: 310,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                        child: Opacity(
                          opacity: imageOpacity,
                          child: Transform.scale(
                            scale: imageScale,
                            child: CachedNetworkImage(
                              fit: BoxFit.fitHeight,
                              imageUrl:
                                  (post.location ?? Locations.ANCONA).imageUrl,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Scroll view
                    Expanded(
                      child: SingleChildScrollView(
                        controller: contentController,
                        padding: const EdgeInsets.only(top: 250, bottom: 210),
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30)),
                            color: Palette.scheme.onPrimary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Autore del post',
                                  style: Fonts.bold(
                                      color: Palette.scheme.primary, size: 20),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Modalità anonima',
                                      style: Fonts.regular(size: 16),
                                    ),
                                    Checkbox(
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                (_) =>
                                                    Palette.scheme.onSecondary),
                                        value: post.anonymous,
                                        onChanged: (_) => setState(() =>
                                            post.anonymous = !post.anonymous)),
                                  ],
                                ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 3.3,
                                  ),
                                  itemCount: tags.length,
                                  itemBuilder: (_, i) => TagItem(tag: tags[i]),
                                ),
                                SizedBox(height: 120)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Footer
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 290,
                        color: Palette.scheme.background,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        child: Row(
                          children: [
                            Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: RoundedButton(
                                  'AZZERA',
                                  invertStyle: true,
                                )),
                            SizedBox(width: 16),
                            Flexible(
                                fit: FlexFit.tight,
                                flex: 1,
                                child: RoundedButton('PUBBLICA')),
                          ],
                        ),
                      ),
                    ),

                    // Top Label
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Palette.scheme.surface,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20)),
                        ),
                        // height: 40,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        child: Text(
                          'Nuovo post',
                          style: Fonts.bold(color: Palette.white, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void initState() {
    contentController.addListener(() {
      setState(() {
        imageOpacity =
            max(0.75, (400 - contentController.position.pixels) / 400);
        imageScale =
            1.05 - 0.05 * min((contentController.position.pixels) / 200, 1);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }
}
