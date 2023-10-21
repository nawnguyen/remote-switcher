import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  TimerPageState createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  late int gio;
  late int phut;
  late int giay;

  @override
  void initState() {
    super.initState();
    updateTime();
  }

  void updateTime() {
    DateTime now = DateTime.now();
    setState(() {
      gio = now.hour;
      phut = now.minute;
      giay = now.second;
    });
    Future.delayed(const Duration(seconds: 1), updateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '$gio:$phut:$giay',
          style: const TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
