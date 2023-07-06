import 'package:firebase_auth/firebase_auth.dart' as auth;
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
    return false;
  }

  Future<void> login(emailAddress,password ) async {
    try {
      final credential = await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
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
    await auth.FirebaseAuth.instance.signOut();
  }

}
