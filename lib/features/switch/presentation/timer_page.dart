import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Icon(CupertinoIcons.timer)),
    );
  }
}
