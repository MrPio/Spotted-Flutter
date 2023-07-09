import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/locations.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/remote_images.dart';
import 'package:spotted_flutter/extension/function/date_time_extensions.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/managers/data_manager.dart';
import 'package:spotted_flutter/model/post.dart';
import 'package:spotted_flutter/model/user.dart';
import 'package:spotted_flutter/view/partials/back_icon.dart';
import 'package:spotted_flutter/view/partials/loading_view.dart';
import 'package:spotted_flutter/view/partials/tag_item.dart';

class ViewPostPage extends StatefulWidget {
  const ViewPostPage(this.post, {super.key});

  final Post post;

  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
  bool isLoading = true;
  final contentController = ScrollController();
  var imageOpacity = 1.0;
  var imageScale = 1.05;

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
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: imageOpacity,
                              child: Transform.scale(
                                scale: imageScale,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fitHeight,
                                  imageUrl:
                                      (widget.post.location ?? Locations.ANCONA)
                                          .imageUrl,
                                ),
                              ),
                            ),
                            Container(color: Palette.white.withOpacity(widget.post.spotted ? 0.35 :0)),
                            Visibility(
                              visible: widget.post.spotted,
                              child: Center(
                                child: Transform.rotate(
                                  angle: -pi / 12,
                                  child: Text(
                                    'Spotted!',
                                    style: Fonts.black(color: Palette.white, size: 44),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Scroll view
                    SingleChildScrollView(
                      controller: contentController,
                      padding: const EdgeInsets.only(top: 250, bottom: 210),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30)),
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
                                    widget.post.location?.title ??
                                        Locations.ANCONA.title,
                                    style: Fonts.black(size: 30),
                                  ),
                                  Visibility(
                                    visible: widget.post.spotted,
                                    child: Text('(Persona spottata)',
                                        style: Fonts.regular()),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Container(
                                        height: 34,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(999),
                                            color: Palette.scheme.onPrimary,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.145),
                                                offset: const Offset(0, 1),
                                                blurRadius: 3,
                                                spreadRadius: 0.3,
                                              )
                                            ]),
                                        child: Material(
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(999),
                                            onTap: () {
                                              if (widget.post.author !=
                                                      null &&
                                                  !widget.post.anonymous &&
                                                  widget.post.authorUID !=
                                                      AccountManager()
                                                          .user
                                                          .uid)
                                                Navigator.of(context)
                                                    .pushNamed('/account',
                                                        arguments: widget
                                                            .post.author);
                                            },
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(
                                                      horizontal: 6,
                                                      vertical: 2),
                                              child: Row(
                                                children: [
                                                  CachedNetworkImage(
                                                      fit: BoxFit.fitHeight,
                                                      imageUrl: widget
                                                              .post
                                                              .author
                                                              ?.avatar ??
                                                          RemoteImages
                                                              .ANONYMOUS.url),
                                                  SizedBox(width: 12),
                                                  Text(
                                                    '${widget.post.author?.name} ${widget.post.author?.surname}',
                                                    style:
                                                        Fonts.bold(size: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '- ${widget.post.date.toDateStr()}',
                                        style: Fonts.regular(size: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '${widget.post.description}',
                                    style: Fonts.light(size: 16),
                                  ),
                                  SizedBox(height: 10),
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
                                    itemCount: widget.post.tags.length,
                                    itemBuilder: (_, i) =>
                                        TagItem(tag: widget.post.tags[i]),
                                  ),
                                  SizedBox(height: 120)
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Container(
                              margin: EdgeInsets.only(right: 40),
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: Palette.scheme.onPrimary,
                              ),
                              height: 70,
                              width: 70,
                              child: Center(
                                child: Material(
                                  borderRadius: BorderRadius.circular(999),
                                  color: Palette.scheme.background,
                                  clipBehavior: Clip.antiAlias,
                                  child: IconButton(
                                    icon: Icon(
                                      widget.post.followers.contains(
                                              AccountManager().user.uid)
                                          ? Icons.bookmark_rounded
                                          : Icons.bookmark_outline_rounded,
                                      size: 29,
                                    ),
                                    onPressed: () async {
                                      if (widget.post.followers.contains(
                                          AccountManager().user.uid)) {
                                        AccountManager()
                                            .user
                                            .following
                                            .remove(widget.post.uid!);
                                        widget.post.followers.remove(
                                            AccountManager().user.uid!);
                                      } else {
                                        AccountManager()
                                            .user
                                            .following
                                            .add(widget.post.uid!);
                                        widget.post.followers
                                            .add(AccountManager().user.uid!);
                                      }
                                      await DataManager().save(widget.post);
                                      await DataManager()
                                          .save(AccountManager().user);
                                      await load();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Footer
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 240,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30)),
                          color: Palette.scheme.background,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Followers
                              widget.post.lastFollowers.length > 0
                                  ? Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(999),
                                            color: Palette.scheme.onPrimary,
                                          ),
                                          width: 30,
                                          height: 30,
                                          clipBehavior: Clip.antiAlias,
                                          child: CachedNetworkImage(
                                            imageUrl: widget.post.lastFollowers
                                                    .first?.avatar ??
                                                RemoteImages.ANONYMOUS.url,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Seguito da ',
                                            style: Fonts.regular(size: 14),
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${widget.post.lastFollowers[0]?.name} ${widget.post.lastFollowers[0]?.surname}',
                                                style: Fonts.bold(size: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(height: 10),
                              widget.post.comments.length == 0
                                  ? Text(
                                      'Non ci sono ancora commenti per questo post',
                                      style: Fonts.light(size: 14),
                                    )
                                  : ListView.builder(
                                shrinkWrap: true,
                                    padding: EdgeInsets.only(bottom: 20),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: widget.post.comments.length,
                                    itemBuilder: (_, i) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4),
                                      child: RichText(
                                        text: TextSpan(
                                          text:
                                              '${widget.post.comments[i].user?.name} ${widget.post.comments[i].user?.surname}:   ',
                                          style: Fonts.bold(size: 14),
                                          children: [
                                            TextSpan(
                                              text: widget
                                                  .post.comments[i].text,
                                              style:
                                                  Fonts.regular(size: 14),
                                            ),
                                            TextSpan(
                                              text:
                                                  ' - (${widget.post.comments[i].date.toPostStr()})',
                                              style: Fonts.light(size: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Back icon
                    BackIcon(),

                    // Percentage
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
                          '${widget.post.calculateRelevance(AccountManager().user.tags)}%',
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

  load() async {
    setState(() => isLoading = true);

    // Carico l'autore del post
    widget.post.author = widget.post.anonymous
        ? User()
        : await DataManager().loadUser(widget.post.authorUID);

    // Carico gli autori dei commenti
    for (var comment in widget.post.comments)
      if (comment.user == null)
        comment.user = (await DataManager().loadUser(comment.authorUID));

    // Carico gli ultimi 3 followers
    widget.post.lastFollowers.clear();
    for (var i = 1; i <= min(3, widget.post.followers.length); i++)
      widget.post.lastFollowers.add(await DataManager()
          .loadUser(widget.post.followers[widget.post.followers.length - i]));

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    load();
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
