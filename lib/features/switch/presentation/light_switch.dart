import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_switch_app/features/core/application/routes/route_names.dart';

import '../shared/providers.dart';

class SwitchModel {
  final String name;
  bool state;

  SwitchModel({required this.name, required this.state});
}

class SwitchPage extends HookConsumerWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(toggleNotifierProvider);

    List<SwitchModel> switches = [
      SwitchModel(name: 'on', state: true),
      SwitchModel(name: 'off', state: false),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle, size: 40),
            onPressed: () {
              _showBottomSheet(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: switches.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onLongPress: () {
                _showDeleteBottomSheet(context, index);
              },
              onTap: () {
                setState(() {
                  switches[index].state = !switches[index].state;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: switches[index].state ? Colors.yellow : Colors.black26,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(switches[index].name),
                ),
              ),
            );
          },
        ),
      ),
    ) ?? Scaffold(
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


  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                title: TextField(
                  decoration: const InputDecoration(labelText: 'Enter Name'),
                  onSubmitted: (value) {
                    setState(() {
                      final switchModel = SwitchModel(name: value, state: false);
                      switches.add(switchModel);
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (switches.isEmpty) {
                    switches.add("New Name" as SwitchModel);
                  }
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                title: const Text('Delete'),
                onTap: () {
                  setState(() {
                    switches.removeAt(index);
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Edit'),
                onTap: () {
                  // Add your edit functionality here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}