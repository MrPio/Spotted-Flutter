import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:spotted_flutter/managers/io_manager.dart';
import 'package:spotted_flutter/model/user.dart';
import 'data_manager.dart';

class AccountManager {
  static final AccountManager _instance = AccountManager._();

  factory AccountManager() => _instance;

  AccountManager._();

  late User user;

  Future<bool> cacheLogin() async {
    String? uid = await IOManager().get_cache_data("uid");
    print("\n\n\n"+uid.toString());
    if (uid==null) return false;
    user = await DataManager().loadUser(uid, force: true);
    return true;
  }

  Future<void> login(emailAddress,password ) async {
    try {
      final credential = await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      IOManager().set_cache_data("uid", credential.user!.uid );
      user = await DataManager().loadUser(credential.user?.uid, force: true);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logout() async {
    IOManager().remove_cache_data("uid");
    await auth.FirebaseAuth.instance.signOut();
  }

}
