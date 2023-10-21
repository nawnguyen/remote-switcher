import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:light_switch_app/features/core/application/routes/route_names.dart';
import 'package:light_switch_app/services/api_service.dart';
import 'package:provider/provider.dart';
import '../../../provider/theme_settings.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
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
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(RouteNames.timerSettingsNameRoute);
        },
        child: const Icon(Icons.timer),
      ),
    );
  }
}
