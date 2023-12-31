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
  int currentIndex = 0;
  bool isLightOn = false; // Track the state of the light

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
/*
            if (currentIndex == 1) // Only show the light control when "Lights" tab is selected
*/
              ClipOval(
                child: Material(
                  color: isLightOn ? Colors.yellow : Colors.grey, // Light on/off color
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isLightOn = !isLightOn;
                      });
                    },
                    child: const SizedBox(
                      width: 100.0, // Adjust the width and height as needed
                      height: 100.0,
                      child: Icon(
                        Icons.lightbulb_sharp,
                        size: 60.0, // Adjust the icon size as needed
                        color: Colors.black, // Icon color
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16.0),
            Text(
              isLightOn ? 'Light is ON' : 'Light is OFF',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_cloudy),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_sharp),
            label: 'Lights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
        ],
      ),
    );
  }
}
