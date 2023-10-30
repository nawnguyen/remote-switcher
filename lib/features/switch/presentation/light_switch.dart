import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:light_switch_app/features/switch/domain/models/add_switch_request.dart';

import '../domain/toggle_switch_model.dart';
import '../shared/providers.dart';

class SwitchPage extends HookConsumerWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switches = ref.watch(switchesNotifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_circle, size: 40),
            onPressed: () {
              _showBottomSheet(context, ref);
            },
          ),
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
            final switchItem = switches[index];

            return GestureDetector(
              onLongPress: () {
                _showDeleteBottomSheet(context, index);
              },
              onTap: () {
                final model = ToggleSwitchModel(switchId: switchItem.id, state: !switchItem.state, deviceId: switchItem.deviceId);
                ref.read(switchesNotifier.notifier).toggle(model);
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
    );
  }

  void _showBottomSheet(BuildContext context, WidgetRef ref) {
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
                    ref.read(switchesNotifier.notifier).add(AddSwitchRequestModel(name: value, deviceId: ''));
                    Navigator.pop(context);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // if (switches.isEmpty) {
                  //   switches.add("New Name" as SwitchModel);
                  // }

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
                  // setState(() {
                  //   switches.removeAt(index);
                  // });
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