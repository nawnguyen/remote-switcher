import 'package:flutter/material.dart';
import 'package:light_switch_app/provider/theme_settings.dart';
import 'package:light_switch_app/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isDark = sharedPreferences.getBool('is_dark') ?? false;
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  const MyApp({
    super.key,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeSettings(isDark),
        builder: (context, snapshot) {
          final settings = Provider.of<ThemeSettings>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: settings.currentTheme,
            home: const MyHomePage(),
          );
        });
  }
}

