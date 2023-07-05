import 'package:spotted_flutter/model/user.dart';

import 'data_manager.dart';

class AccountManager {
  static final AccountManager _instance = AccountManager._();

  factory AccountManager() => _instance;

  AccountManager._();

  late User user;

  Future<bool> cacheLogin() async {
    const uid = "rPg4dSvpc3dJO6Re3WLk4exxBWa2";
    user = await DataManager().loadUser(uid, force: true);
    return true;
  }
}
