import 'package:spotted_flutter/managers/database_manager.dart';
import 'package:spotted_flutter/model/post.dart';
import 'package:spotted_flutter/model/setting_menu.dart';
import 'package:spotted_flutter/model/tag.dart';
import 'package:spotted_flutter/model/user.dart';

enum SaveMode { post, put }

class DataManager {
  static final DataManager _instance = DataManager._();

  factory DataManager() => _instance;

  DataManager._();

  static const pageSize = 100;

  List<Post> posts = [];
  List<Tag> tags = [];
  List<SettingMenu> settingMenus = [];
  final anonymous = User();
  List<User> _cachedUsers = [];

  /// Fetch all the application's needed start data
  Future<void> fetchData() async {
    // tags = DatabaseManager.getList<Tag>("tags", pageSize = 999)?.toSet() ?: setOf()
    // cachedUsers = DatabaseManager.getList<User>("users", 9999)?.toMutableSet() ?: mutableSetOf()
    // settingMenus=SeederManager.generateSettings(context)
  }
}
