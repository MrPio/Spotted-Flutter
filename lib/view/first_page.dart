import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotted_flutter/managers/account_manager.dart';
import 'package:spotted_flutter/managers/data_manager.dart';
import 'package:spotted_flutter/view/fragments/first_fragment.dart';
import 'package:spotted_flutter/view/partials/loading_view.dart';

import '../enums/strings.dart';
import 'fragments/login_fragment.dart';
import 'fragments/signup_fragment.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentPageIndex = 0;
  late List<Widget> _pages;
  bool isLoading = true;

  // Funzione di callback per cabiare i fragment
  void setFragmentIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _PATH = "assets/images/";
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${_PATH}first_access.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 56.0),
                  child: Text(
                    appTitle,
                    style: GoogleFonts.clickerScript(
                      fontSize: 52,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            _pages[_currentPageIndex],
            LoadingView(visible: isLoading)
          ],
        ),
      );
  }

  @override
  void initState() {
    super.initState();

    _pages = [
      FirstFragment(setIndex: setFragmentIndex),
      LoginFragment(setIndex: setFragmentIndex),
      SignupFragment(setIndex: setFragmentIndex),

    ];

    // Ensure the navigation to occur after the state is built
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Firebase.initializeApp();
      await initialize();
    });
  }

  initialize() async {
    Navigator.popUntil(context, (route) => route.isFirst);
    await DataManager().fetchData();
    if (await AccountManager().cacheLogin()) {
      Navigator.of(context).popAndPushNamed("/main");
    }
    setState(() => isLoading = false);
  }
}
