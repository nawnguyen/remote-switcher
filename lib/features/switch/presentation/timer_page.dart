import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({
    Key? key,
  }) : super(key: key);

  @override
  TimerPageState createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  String timeString = '';

  @override
  void initState() {
    super.initState();
    updateClock();
  }

  void updateClock() {
    setState(() {
      DateTime now = DateTime.now();
      timeString = '${now.hour}:${now.minute}:${now.second}';
    });
    Future.delayed(const Duration(seconds: 1), updateClock);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          timeString,
          style: const TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
