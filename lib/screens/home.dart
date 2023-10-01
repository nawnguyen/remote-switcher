import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _toggleTheme() {
    final settings = Provider.of<ThemeSettings>(context, listen: false);
    settings.toggleTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipOval(
          child: Material(
            color: Colors.amber, // Background color
            child: InkWell(
              onTap: _toggleTheme,
              child: const SizedBox(
                width: 100.0, // Adjust the width and height as needed
                height: 100.0,
                child: Icon(
                  Icons.lightbulb_sharp,
                  size: 60.0, // Adjust the icon size as needed
                  color: Colors.white, // Icon color
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}