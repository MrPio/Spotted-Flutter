import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:spotted_flutter/enums/palette.dart';
import 'package:spotted_flutter/managers/data_manager.dart';
import 'package:spotted_flutter/model/post.dart';
import 'package:spotted_flutter/model/user.dart';
import 'package:spotted_flutter/view/first_page.dart';
import 'package:spotted_flutter/view/main_page.dart';
import 'package:spotted_flutter/view/view_post_page.dart';

import 'view/account_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Palette.black, systemNavigationBarColor: Palette.black));
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if it is dark theme
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isLight = brightness == Brightness.light;

    // App color scheme
    Palette.theme = ThemeData(
        brightness: brightness,
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white.withAlpha(130),
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: isLight ? Palette.red : Palette.white,
          onPrimary: isLight ? Palette.white : Palette.black,
          secondary: isLight ? Palette.white : Palette.black,
          onSecondary: isLight ? Palette.black : Palette.white,
          error: Colors.red,
          onError: Colors.black54,
          background: isLight ? Palette.grey : Palette.darkBlack,
          onBackground: isLight ? Palette.black : Palette.grey,
          surface: isLight ? Palette.black : Palette.darkBlack,
          onSurface: isLight ? Palette.white : Palette.darkBlack,
        ));

    return MaterialApp(
      title: 'Spotted!',
      theme: Palette.theme,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: MediaQuery.of(context).textScaleFactor*1//0.96,
          ),
          child: child!,
        );
      },
      routes: <String, WidgetBuilder>{
        '/': ( context) => FirstPage(),
        '/main': ( context) => MainPage(),
        '/view_post': ( context) => ViewPostPage((ModalRoute.of(context)?.settings.arguments ??Post()) as Post),
        '/account': ( context) => AccountPage((ModalRoute.of(context)?.settings.arguments ??User()) as User),
      },
    );
  }
}
