import 'package:hive_flutter/hive_flutter.dart';
import 'package:light_switch_app/features/switch/domain/constants/hive_boxes_keys.dart';

class HiveDatabase {
  static Future<void> init() async {
    await Hive.initFlutter();

    // Store all data in memory
    await Hive.openBox(HiveBoxKeys.switches);
    await Hive.openBox<bool>(HiveBoxKeys.theme);
  }
}
