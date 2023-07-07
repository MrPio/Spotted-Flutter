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
    if (uid == null) return false;
    user = await DataManager().loadUser(uid, force: true);
    return true;
  }

  Future<void> login(emailAddress, password) async {
    try {
      final credential = await auth.FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      IOManager().set_cache_data("uid", credential.user!.uid);
      user = await DataManager().loadUser(credential.user?.uid);
    } catch (e) {
      throw ('Username o password errati');
    }
  }


Future<void> signUp(email, password, User newUser) async {
  try {
    final credential = await auth.FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    newUser.uid = credential.user!.uid;
    DataManager().save(newUser);
    await login(email, password);
  } on auth.FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}


Future<void> logout() async {
  IOManager().remove_cache_data("uid");
  await auth.FirebaseAuth.instance.signOut();
}

}
