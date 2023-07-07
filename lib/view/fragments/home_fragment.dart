import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/enums/fonts.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/enums/remote_images.dart';
import 'package:spotted_flutter/extension/function/context_extensions.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/managers/data_manager.dart';
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
  List<Post?> posts = [];
  var isLoading = true;
  final _postsController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Palette.scheme.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            onPressed: () =>context.popup('Impostazioni', message: 'Spiacenti, le impostazioni non sono acora state sviluppate, non sarebbe grandioso però?'),
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

              // Title
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ciao, ${AccountManager().user.name}!",
                      style: Fonts.black(),
                    ),
                    Text(
                      "Ecco gli ultimi post di spotted, ti riconosci?",
                      style: Fonts.regular(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),

              // Posts list
              Expanded(
                child: RefreshIndicator(
                  onRefresh: reload,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: posts.length,
                    controller: _postsController,
                    itemBuilder: (context, i) => SpotPost(post: posts[i],refreshHomeCallback: reload),
                    padding: const EdgeInsets.only(bottom: 120),
                  ),
                ),
              ),
            ],
          ),
        ),
        // LoadingView(
        //   visible: isLoading,
        // )
      ],
    );
  }

  Future<void> reload() async {
    DataManager().reloadPaginatedData();
    await loadMore();
  }

  loadMore() async {
    setState(() => posts = List.generate(10, (_) => null));
    await DataManager().loadMore();
    await Future.delayed(Duration(milliseconds: 300));
    posts = DataManager().posts;
    for(var post in posts.where((post) =>post!=null && post.author==null))
      post!.author=await DataManager().loadUser(post.authorUID);
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    reload();
    _postsController.addListener(() {
      if (_postsController.position.pixels >
          _postsController.position.maxScrollExtent - 50) {
        isLoading = true;
        setState(() {});
        loadMore();
      }
    });
  }

  @override
  void dispose() {
    _postsController.dispose();
    super.dispose();
  }
}
