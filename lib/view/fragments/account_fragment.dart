import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/tags.dart';
import 'package:spotted_flutter/extension/function/context_extensions.dart';
import 'package:spotted_flutter/extension/function/list_extensions.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/managers/data_manager.dart';
import 'package:spotted_flutter/model/user.dart';
import 'package:spotted_flutter/view/partials/loading_view.dart';
import 'package:spotted_flutter/view/partials/spot_post.dart';
import 'package:spotted_flutter/view/partials/tag_item.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment(
      this.changeIndexCallback, this.changeBottomBarOffsetYCallback,
      {super.key, required this.user, this.inPage = false});

  final User user;
  final Function(int) changeIndexCallback;
  final Function(double) changeBottomBarOffsetYCallback;
  final bool inPage;

  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  final contentController = ScrollController();
  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Palette.scheme.surface,
            child: Expanded(
              child: SingleChildScrollView(
                controller: contentController,
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.user.avatar,
                      ),
                    ),

                    // Nome e cognome
                    SizedBox(height: 10),
                    Text(
                      '${widget.user.name} ${widget.user.surname}',
                      textAlign: TextAlign.center,
                      style: Fonts.bold(color: Palette.white, size: 20),
                    ),

                    // Instagram
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/instagram.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '${widget.user.instagramNickname}',
                          style: Fonts.regular(color: Palette.white, size: 16),
                        ),
                      ],
                    ),

                    // Post, Following e Commenti counters
                    DefaultTextStyle(
                      style: Fonts.regular(size: 16, color: Palette.white),
                      child: Container(
                        margin: EdgeInsets.only(top: 26, left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Text('${widget.user.posts.length}'),
                              Text('Posts')
                            ]),
                            Column(children: [
                              Text('${widget.user.following.length}'),
                              Text('Following')
                            ]),
                            Column(children: [
                              Text('${widget.user.comments.length}'),
                              Text('Commenti')
                            ]),
                          ],
                        ),
                      ),
                    ),

                    widget.inPage
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 30, top: 24, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      backgroundColor: Palette.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    onPressed: () => _startURI('sms'),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.message_outlined,
                                          size: 26,
                                          color: Palette.black,
                                        ),
                                        Text('Messaggia',
                                            style: Fonts.regular(
                                                color: Palette.black, size: 15))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      backgroundColor: Palette.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    onPressed: () => _startURI('tel'),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.call_outlined,
                                            size: 26, color: Palette.white),
                                        Text('Chiama',
                                            style: Fonts.regular(
                                                color: Palette.white, size: 15))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),

                    // Bottom Content
                    SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: Palette.scheme.secondary, // Replace with your desired color
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'I miei tag',
                              style: Fonts.bold(
                                  color: Palette.scheme.primary, size: 20),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 2.8,
                              ),
                              itemCount: widget.inPage
                                  ? widget.user.tags.length
                                  : Tags.values.length,
                              itemBuilder: (_, i) {
                                final tag = widget.inPage
                                    ? widget.user.tags[i]
                                    : Tags.values[i];
                                return TagItem(
                                  tag: tag,
                                  selected: widget.inPage
                                      ? true
                                      : widget.user.tags.contains(tag),
                                  onTap: widget.inPage
                                      ? null
                                      : () {
                                          setState(() =>
                                              widget.user.tags.toggle(tag));
                                          DataManager().save(widget.user);
                                        },
                                );
                              },
                            ),
                          ),

                          // HLine
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              height: 1.2,
                              width: double.infinity,
                              color:
                                  Palette.scheme.onSecondary.withOpacity(0.1)),

                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'I miei post',
                              style: Fonts.bold(
                                  color: Palette.scheme.primary, size: 20),
                            ),
                          ),
                          SizedBox(height: 20),
                          widget.user.posts.isEmpty
                              ? SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Ancora nessun post',
                                    textAlign: TextAlign.center,
                                    style: Fonts.black(
                                        color: Palette.scheme.onBackground
                                            .withOpacity(0.3)),
                                  ),
                                )
                              : CarouselSlider(
                                  options: CarouselOptions(
                                    height: 210,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  items: widget.user.posts
                                      .map((post) => SpotPost(
                                            post: post,
                                            margin: false,
                                          ))
                                      .toList(),
                                ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Logout
          widget.inPage
              ? Container()
              : Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(999),
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          splashRadius: 40,
                          onPressed: _logout,
                          icon: Icon(Icons.logout_rounded,
                              size: 28, color: Palette.white),
                        ),
                      ),
                    ),
                  ),
                ),

          // Back Icon
          widget.inPage
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(999),
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: IconButton(
                          splashRadius: 40,
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.chevron_left_rounded,
                              size: 28, color: Palette.white),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),

          // LoadingView
          LoadingView(visible: isLoading),
        ],
      ),
    );
  }

  _logout() async {
    context.popup('Logout',
        message:
            'Sei sicuro di voler uscire dall\'account? Dovrai poi eseguire il login per proseguire.',
        positiveText: 'Si', positiveCallback: () async {
      await AccountManager().logout();
      Navigator.of(context).popAndPushNamed("/");
    }, negativeText: 'No');
  }

  _startURI(String scheme) async {
    final uri = Uri(
      scheme: scheme,
      path: widget.user.cellNumber,
    );
    await launchUrl(uri);
  }

  @override
  void initState() {
    contentController.addListener(() {
      final scroll = contentController.position.pixels;
      setState(() {
        widget.changeBottomBarOffsetYCallback(scroll);
      });
    });
    Future.sync(() async {
      if (widget.inPage) {
        setState(() =>isLoading=true);
        await DataManager().loadUserPosts(widget.user);
        setState(() =>isLoading=false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }
}
