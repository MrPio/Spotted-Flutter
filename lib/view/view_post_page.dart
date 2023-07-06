import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/locations.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/model/post.dart';

class ViewPostPage extends StatefulWidget {
  const ViewPostPage({super.key});

  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  @override
  Widget build(BuildContext context) {
    final post = (ModalRoute.of(context)!.settings.arguments ?? Post()) as Post;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Palette.scheme.background,
          child: Stack(
            children: [
              // BG image
              Container(
                color: Palette.scheme.surface,
                height: 310,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    imageUrl: (post.location ?? Locations.ANCONA).imageUrl,
                  ),
                ),
              ),

              // Back icon
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsetsDirectional.only(start: 24, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: Palette.white.withOpacity(0.5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: Center(
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        icon: Icon(Icons.chevron_left_rounded,
                            color: Palette.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ),

              // White container
              Container(
                margin: EdgeInsets.only(top: 280),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: Palette.scheme.onPrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding:const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(post.location?.title??Locations.ANCONA.title,style: Fonts.black(size: 30),)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                        color: Palette.scheme.background,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
