import 'dart:ffi';

import 'package:spotted_flutter/enums/tags.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/managers/database_manager.dart';
import 'package:spotted_flutter/model/post.dart';
import 'package:spotted_flutter/model/setting_menu.dart';
import 'package:spotted_flutter/model/user.dart';
import 'package:collection/collection.dart';

enum SaveMode { post, put }

class DataManager {
  static final DataManager _instance = DataManager._();

  factory DataManager() => _instance;

  DataManager._();

  static const pageSize = 100;

  List<Post> posts = [];
  List<Tags> tags = [];
  List<SettingMenu> settingMenus = [];
  final anonymous = User();
  List<User> cachedUsers = [];

  /// Fetch all the application's needed start data
  fetchData() async {
    tags = Tags.values.toList(growable: false);
    cachedUsers = (await DatabaseManager().getList('users', pageSize: 9999))
            ?.map((e) => User.fromJson(e))
            .toList() ??
        [];
    // settingMenus=SeederManager.generateSettings(context)
  }

  // Request a new page for paginated data
  loadMore() async {
    posts.addAll((await DatabaseManager().getList("posts"))
            ?.map((e) => Post.fromJson(e))
            .sorted((a, b) => a.timestamp.compareTo(b.timestamp))
            .reversed ??
        []);
  }

  // Remove the last page pointer of paginated data
  reloadPaginatedData() {
    posts = [];
    DatabaseManager().paginateKeys.clear();
  }

  /// Load a single User object from a given uid
  Future<User> loadUser(String? uid, {force = false}) async {
    if (!force) {
      // Is anonymous?
      if (uid == null) {
        return anonymous;
      }

      // Already cached?
      User? cachedUser =
          cachedUsers.firstWhereOrNull((user) => user.uid == uid);
      if (cachedUser != null) {
        return cachedUser;
      }

      // Is current User?
      if (AccountManager().user.uid == uid) {
        return AccountManager().user;
      }
    }

    // Ask the database for the user and caching it
    User? user = User.fromJson(await DatabaseManager().get("users/$uid"));
    user.uid = uid;
    loadUserPosts(user);
    loadUserFollowingPosts(user);
    cachedUsers.add(user);
    return user;
  }

  /// Load the first 30 posts of a given User
  loadUserPosts(User user) async {
    user.posts.clear();
    for (String postUID in user.postsUIDs.reversed.take(30)) {
      if (user.posts.firstWhereOrNull((post) => post.uid == postUID) == null) {
        Post post =
            Post.fromJson(await DatabaseManager().get('posts/$postUID'));
        post.uid = postUID;
        user.posts.add(post);
      }
    }
  }

  /// Load the first 30 following posts of a given User
  loadUserFollowingPosts(User user) async {
    user.followingPosts.clear();
    for (String postUID in user.following.reversed.take(30)) {
      if (user.posts.firstWhereOrNull((post) => post.uid == postUID) == null) {
        Post post =
            Post.fromJson(await DatabaseManager().get('posts/$postUID'));
        post.uid = postUID;
        user.followingPosts.add(post);
      }
    }
  }
}
