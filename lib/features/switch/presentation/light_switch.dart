import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key}) : super(key: key);

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class SwitchModel {
  final String name;
  bool state;

  SwitchModel({required this.name, required this.state});
}

class _SwitchPageState extends State<SwitchPage> {
  List<SwitchModel> switches = [
    SwitchModel(name: 'on', state: true),
    SwitchModel(name: 'off', state: false),
  ];

  @override
  Widget build(BuildContext context) {
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
                    // switches.add("New Name");
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
          child: ListTile(
            title: Text('Delete'),
            onTap: () {
              setState(() {
                switches.removeAt(index);
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}
