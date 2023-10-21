import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_switch_app/features/core/application/routes/route_names.dart';

import '../shared/providers.dart';

class SwitchPage extends HookConsumerWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(toggleNotifierProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Material(
                color: model.state ? Colors.yellow : Colors.grey, // Light on/off color
                child: InkWell(
                  onTap: () {
                    ref.read(toggleNotifierProvider.notifier).toggle(model.copyWith(state: !model.state));
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
              model.state ? 'Light is ON' : 'Light is OFF',
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