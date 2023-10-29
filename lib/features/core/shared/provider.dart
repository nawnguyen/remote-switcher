import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../switch/domain/constants/hive_boxes_keys.dart';
import '../application/routes/route_notifier.dart';
import '../application/theme_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final routerProvider = Provider<GoRouter>((ref) => RouterNotifier.init());

final themeBox = Provider<Box<bool>>((ref) => Hive.box<bool>(HiveBoxKeys.theme));
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(ref.watch(themeBox)),
);
