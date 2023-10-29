import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_switch_app/features/switch/domain/constants/hive_boxes_keys.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final Box<bool> themeBox;

  ThemeNotifier(this.themeBox) : super(ThemeMode.light) {
    final darkMode = themeBox.get(HiveBoxKeys.theme, defaultValue: false)!;
    _set(darkMode);
  }

  void toggle(bool darkMode) {
    themeBox.put(HiveBoxKeys.theme, darkMode);
    _set(darkMode);
  }

  void _set(bool darkMode) {
    state = darkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
