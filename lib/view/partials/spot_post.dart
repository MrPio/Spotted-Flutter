import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/locations.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/remote_images.dart';
import 'package:spotted_flutter/extension/function/date_time_extensions.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/model/post.dart';
import 'package:spotted_flutter/view/partials/highlight_view.dart';
import 'package:spotted_flutter/view/partials/tag_item.dart';

class SpotPost extends StatelessWidget {
  const SpotPost(
      {this.post, super.key, this.refreshHomeCallback, this.margin = true});

  final Post? post;
  final Function()? refreshHomeCallback;
  final bool margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: margin ? 20 : 0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          color: Palette.scheme.onPrimary,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(post == null ? 0 : 0.1),
              offset: const Offset(0, 3),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        height: 210,
        clipBehavior: Clip.antiAlias,
        child: post == null
            ? Shimmer(
                gradient: LinearGradient(
                  begin: Alignment(1.0, 1),
                  end: Alignment(-1.0, -1),
                  colors: [
                    Colors.grey.shade300,
                    Colors.grey.shade100,
                    Colors.grey.shade300
                  ],
                  stops: [0.42, 0.5, 0.58],
                ),
                child: Container(
                  color: Colors.grey[300],
                ),
              )
            : Stack(
                children: [
                  Opacity(
                    opacity: post?.spotted ?? false ? 0.6 : 1,
                    child: Stack(
                      children: [
                        // BG image
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                (post!.location ?? Locations.ANCONA).imageUrl,
                          ),
                        ),

                        // Vignette
                        Opacity(
                          opacity: 0.85,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.black, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment(0.0, -0.25),
                              ),
                            ),
                          ),
                        ),

                        // HighlightView
                        HighlightView(
                            onTap: () => Navigator.of(context)
                                .pushNamed("/view_post", arguments: post)
                                .then((value) => refreshHomeCallback?.call())),

                        // Content
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Top content
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 24,
                                          decoration: BoxDecoration(
                                            color: Palette.red,
                                            borderRadius:
                                                BorderRadius.circular(999),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${post!.calculateRelevance(AccountManager().user.tags)}%",
                                                style: Fonts.regular(
                                                    color: Palette.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsetsDirectional.only(
                                                  start: 4),
                                          height: 26,
                                          decoration: BoxDecoration(
                                            color: Palette.black,
                                            borderRadius:
                                                BorderRadius.circular(999),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                post!.date.toPostStr(),
                                                style: Fonts.regular(
                                                    color: Palette.white),
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
                                        borderRadius:
                                            BorderRadius.circular(999),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(999),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: post?.author?.avatar ??
                                              RemoteImages.ANONYMOUS.url,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              // Bottom content
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Palette.white,
                                              size: 26,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              (post!.location ??
                                                      Locations.ANCONA)
                                                  .title,
                                              style: Fonts.bold(
                                                  color: Palette.white),
                                            )
                                          ],
                                        ),
                                        Icon(
                                          post!.gender.icon,
                                          color: Palette.white,
                                          size: 36,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today,
                                              color: Palette.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              post!.date.toDateStr(),
                                              style: Fonts.regular(
                                                  color: Palette.white),
                                            ),
                                            SizedBox(width: 8),
                                            Icon(
                                              Icons.access_time_filled,
                                              color: Palette.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              post!.date.toTimeStr(),
                                              style: Fonts.regular(
                                                  color: Palette.white),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.message,
                                              color: Palette.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              post!.comments.length.toString(),
                                              style: Fonts.regular(
                                                  color: Palette.white),
                                            ),
                                            SizedBox(width: 8),
                                            Icon(
                                              Icons.bookmark,
                                              color: Palette.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              post!.followers.length.toString(),
                                              style: Fonts.regular(
                                                  color: Palette.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 30,
                                          child: ListView.builder(
                                            padding:
                                                EdgeInsetsDirectional.symmetric(
                                                    horizontal: 20),
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: post!.tags.length,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4),
                                              child: TagItem(
                                                  tag: post!.tags[index]),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IgnorePointer(
                    child: Visibility(
                      visible: post?.spotted ?? false,
                      child: Center(
                        child: Transform.rotate(
                          angle: -pi / 12,
                          child: Text(
                            'Spotted!',
                            style: Fonts.black(color: Palette.white, size: 32),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
