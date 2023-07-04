import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:spotted_flutter/enums/colors.dart';
import 'package:spotted_flutter/view/first_page.dart';
import 'package:spotted_flutter/view/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if it is dark theme
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDark = brightness == Brightness.dark;

    // App color scheme
    final ThemeData theme = ThemeData(
        brightness: brightness,
        splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white.withAlpha(100),
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: isDark ? Palette.red.color : Palette.red.color,
          onPrimary: isDark ? Palette.white.color : Palette.black.color,
          secondary: isDark ? Palette.white.color : Palette.black.color,
          onSecondary: isDark ? Palette.black.color : Palette.white.color,
          error: Colors.red,
          onError: Colors.black54,
          background: isDark ? Palette.grey.color : Palette.darkBlack.color,
          onBackground: isDark ? Palette.black.color : Palette.grey.color,
          surface: Colors.black26,
          onSurface: isDark ? Palette.white.color : Palette.darkBlack.color,
        ));

    return MaterialApp(
      title: 'Spotted!',
      theme: theme,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const FirstPage(),
        '/main': (BuildContext context) => const MainPage(),
      },
    );
  }
}
