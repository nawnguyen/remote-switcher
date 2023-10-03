import 'package:flutter/material.dart';
import 'package:light_switch_app/services/api_service.dart';
import 'package:provider/provider.dart';
import '../provider/theme_settings.dart';
import 'package:dio/dio.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio dio = Dio();
  final service = APIService();

  Future<void> _toggleTheme() async {
    final settings = Provider.of<ThemeSettings>(context, listen: false);
    settings.toggleTheme();

    await Future.delayed(const Duration(milliseconds: 1));

    try {
      if (settings.isDark) {
        service.toggle('off');
      } else {
        service.toggle('on');
      }
    } catch (error) {}
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