import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/gender.dart';
import 'package:spotted_flutter/enums/locations.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/tags.dart';
import 'package:spotted_flutter/extension/function/context_extensions.dart';
import 'package:spotted_flutter/extension/function/list_extensions.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/managers/data_manager.dart';
import 'package:spotted_flutter/model/post.dart';
import 'package:spotted_flutter/view/partials/loading_view.dart';
import 'package:spotted_flutter/view/partials/rounded_button.dart';
import 'package:spotted_flutter/view/partials/tag_item.dart';

class AddPostFragment extends StatefulWidget {
  const AddPostFragment(
      this.changeIndexCallback, this.changeBottomBarOffsetYCallback,
      {super.key});

  final Function(int) changeIndexCallback;
  final Function(double) changeBottomBarOffsetYCallback;

  @override
  State<AddPostFragment> createState() => _AddPostFragmentState();
}

class _AddPostFragmentState extends State<AddPostFragment> {
  Post post = Post(authorUID: AccountManager().user.uid, location: Locations.ANCONA);
  bool isLoading = false;
  final contentController = ScrollController();
  var imageOpacity = 1.0;
  var imageScale = 1.05;
  var footerOffsetY = 0.0;
  var errors = '';

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
                        padding: const EdgeInsets.only(top: 250, bottom: 0),
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
                                // ANONYMOUS
                                Text(
                                  'Autore del post',
                                  style: Fonts.bold(
                                      color: Palette.scheme.primary, size: 20),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Modalità anonima:',
                                        style: Fonts.regular(size: 16),
                                      ),
                                      Checkbox(
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (_) => Palette
                                                      .scheme.onSecondary),
                                          value: post.anonymous,
                                          onChanged: (_) => setState(() => post
                                              .anonymous = !post.anonymous)),
                                    ],
                                  ),
                                ),

                                // HLine
                                Container(
                                    height: 1.2,
                                    width: double.infinity,
                                    color: Palette.scheme.onSecondary
                                        .withOpacity(0.1)),

                                // ZONA
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Zona',
                                    style: Fonts.bold(
                                        color: Palette.scheme.primary,
                                        size: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: DropdownButton(
                                    underline: Container(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    style: Fonts.regular(size: 16),
                                    value: post.location!.name,
                                    items: Locations.values
                                        .map((e) => DropdownMenuItem<String>(
                                              value: e.name,
                                              child: Text(e.title),
                                            ))
                                        .toList(),
                                    onChanged: (value) => setState(() =>
                                        post.location = Locations.values
                                            .firstWhere(
                                                (e) => e.name == value)),
                                  ),
                                ),

                                // HLine
                                Container(
                                    height: 1.2,
                                    width: double.infinity,
                                    color: Palette.scheme.onSecondary
                                        .withOpacity(0.1)),

                                // GENDER
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Genere',
                                    style: Fonts.bold(
                                        color: Palette.scheme.primary,
                                        size: 20),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: DropdownButton(
                                    underline: Container(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8),
                                    style: Fonts.regular(size: 16),
                                    value: post.gender.name,
                                    items: Gender.values
                                        .map((e) => DropdownMenuItem<String>(
                                              value: e.name,
                                              child: Row(
                                                children: [
                                                  Icon(e.icon),
                                                  SizedBox(width: 10),
                                                  Text(e.title)
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) => setState(() =>
                                        post.gender = Gender.values.firstWhere(
                                            (e) => e.name == value)),
                                  ),
                                ),

                                // HLine
                                Container(
                                    height: 1.2,
                                    width: double.infinity,
                                    color: Palette.scheme.onSecondary
                                        .withOpacity(0.1)),

                                // TAGS
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Tags',
                                    style: Fonts.bold(
                                        color: Palette.scheme.primary,
                                        size: 20),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Scegli almeno 3 dei seguenti tags:',
                                  style: Fonts.regular(size: 16),
                                ),
                                SizedBox(height: 20),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 2.8,
                                  ),
                                  itemCount: Tags.values.length,
                                  itemBuilder: (_, i) {
                                    final tag = Tags.values[i];
                                    return TagItem(
                                      tag: tag,
                                      selected: post.tags.contains(tag),
                                      onTap: () =>
                                          setState(() => post.tags.toggle(tag)),
                                    );
                                  },
                                ),
                                SizedBox(height: 20),

                                // HLine
                                Container(
                                    height: 1.2,
                                    width: double.infinity,
                                    color: Palette.scheme.onSecondary
                                        .withOpacity(0.1)),

                                // DESCRIZIONE
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Descrizione',
                                    style: Fonts.bold(
                                        color: Palette.scheme.primary,
                                        size: 20),
                                  ),
                                ),
                                TextField(
                                  style: Fonts.regular(size: 16),
                                  maxLines: 3,
                                  onChanged: (value) =>
                                      setState(() => post.description = value),
                                  decoration: InputDecoration(
                                    hintText: 'Indossava una felpa nera',
                                  ),
                                ),

                                // HLine
                                Container(
                                    height: 1.2,
                                    width: double.infinity,
                                    color: Palette.scheme.onSecondary
                                        .withOpacity(0.1)),

                                // ERRORS
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    errors,
                                    style: Fonts.bold(size: 16),
                                  ),
                                ),

                                SizedBox(height: 100),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Footer
                    Transform.translate(
                      offset: Offset(0, footerOffsetY),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 190,
                          color: Palette.scheme.background,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: RoundedButton(
                                    'AZZERA',
                                    invertStyle: true,
                                    onTap: azzera,
                                  )),
                              SizedBox(width: 16),
                              Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: RoundedButton(
                                    'PUBBLICA',
                                    onTap: pubblica,
                                  )),
                            ],
                          ),
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

  azzera() => setState(() =>
      post = Post(authorUID: AccountManager().user.uid, location: Locations.ANCONA));

  pubblica() {
    final errors = post.validate();
    if (errors.isEmpty) {
      post.timestamp = DateTime.now().millisecondsSinceEpoch;
      DataManager().save(post, SaveMode.POST);
      azzera();
      context.popup(
        'Post pubblicato!',
        message: 'Il tuo post è stato pubblicato correttamente!',
        positiveText: 'Vai alla Home',
        positiveCallback: () {
          widget.changeIndexCallback(0);
          widget.changeBottomBarOffsetYCallback(0);
        },
      );
    } else {
      this.errors = '• ' + errors.join("\n• ");
      contentController.animateTo(contentController.position.maxScrollExtent,
          duration: Duration(milliseconds: 600), curve: Curves.easeOut);
    }
    setState(() {});
  }

  @override
  void initState() {
    contentController.addListener(() {
      final scroll = contentController.position.pixels;
      setState(() {
        imageOpacity = max(0.75, (400 - scroll) / 400);
        imageScale = 1.05 - 0.05 * min((scroll) / 200, 1);
        footerOffsetY = min(110, scroll);
        widget.changeBottomBarOffsetYCallback(scroll);
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
