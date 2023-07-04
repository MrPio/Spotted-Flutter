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
    return const Placeholder();
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
