import 'package:flutter/material.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/view/fragments/account_fragment.dart';
import 'package:spotted_flutter/view/partials/back_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage(this.user, {super.key});

  final user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AccountFragment((p0) => null, (p0) => null, user: user,inPage:true),
      ),
    );
  }
}
