import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/remote_images.dart';
import 'package:spotted_flutter/extension/function/date_time_extensions.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/model/post.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SpotPost extends StatefulWidget {
  const SpotPost({required this.post, super.key});

  final Post post;

  @override
  State<SpotPost> createState() => _SpotPostState();
}

class _SpotPostState extends State<SpotPost> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        decoration: BoxDecoration(
          color: Palette.scheme.onPrimary,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 3),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        height: 210,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              // BG image
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.post.location.imageUrl,
                ),
              ),

              // Vignette
              Opacity(
                opacity: 0.75,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),
              ),

              Material(
                color: Colors.transparent,
                child: SizedBox.fromSize(
                    size: Size.infinite,
                    child: InkWell(
                      onTap: () {},
                    )),
              ),

              // Content
              SizedBox.fromSize(
                size: Size.infinite,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Palette.red,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${widget.post.calculateRelevance(AccountManager().user.tags)}%",
                                      style: Fonts.regular(Palette.white),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsetsDirectional.only(start: 4),
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Palette.black,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      widget.post.date.toPostStr(),
                                      style: Fonts.regular(Palette.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Avatar
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Palette.white,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: widget.post.author?.avatar ??
                                  RemoteImages.ANONYMOUS.url,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
