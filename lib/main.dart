import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_switch_app/features/core/presentation/app_widget.dart';

import 'config/configuration.dart';

void main() => Main();

class Main extends Startup {
  @override
  FutureOr<HookConsumerWidget> onCreate() {
    ErrorWidget.builder = (details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return const ColoredBox(color: Colors.transparent);
    };

    return const AppWidget();
  }
}
