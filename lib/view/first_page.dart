import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    const _PATH = "assets/images/";
    return MaterialApp(
      home: Scaffold(
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
                  colors: [Color(0xFF000000), Color(0x00000000)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: const Padding(
                  padding: EdgeInsets.only(top: 56.0),
                  child: Text(
                    'Spotted!',
                    style: TextStyle(
                      fontFamily: 'clicker_script_regular',
                      fontSize: 52,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Ensure the navigation to occur after the state is built
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushNamed("/main");
    });
  }
}
