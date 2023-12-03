import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupsPage extends StatefulWidget {
  GroupsPage({Key? key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final myController = TextEditingController();
  final List<GroupTileModel> listGroup = [
    const GroupTileModel(title: 'Huế', deviceCount: 15),
    const GroupTileModel(title: 'Đà Nẵng', deviceCount: 6),
    const GroupTileModel(title: 'Thái Nguyên', deviceCount: 6),
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // listGroup.add(const GroupTileModel(title: 'a', deviceCount: 71));
    return Scaffold(
      backgroundColor: const Color(0xFF1F2439),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          toolbarHeight: 64,
          leadingWidth: 64,
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.left_chevron,
              size: 35,
            ),
            onPressed: () {
              // Handle back button press here
            },
          ),
          title: Text(
            'Groups',
            style: GoogleFonts.nunito(
                textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              height: 32.74 / 24,
              letterSpacing: 0.1,
            )),
          ),
          backgroundColor: const Color(0xFF1F2439),
          elevation: 0,
          centerTitle: true,
          actions: <Widget>[
            SizedBox(
              width: 64,
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.plus,
                  size: 35,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF2E334A),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 18, 18, 42),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Add group',
                                    style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Nutito',
                                        letterSpacing: 0.1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 38),
                                Container(
                                  height: 64,
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF00B4F0),
                                        Color(0xFF356FDE)
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0xFF1F2439),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 22),
                                      child: TextField(
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                        controller: myController,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Name',
                                          hintStyle: TextStyle(
                                            color: Color(0xF9293A4),
                                            fontSize: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 42),
                                GestureDetector(
                                  onTap: () {
                                    if (myController.text.isEmpty) {
                                      return;
                                    }
                                    setState(() {
                                      // add item to list
                                      listGroup.add(GroupTileModel(
                                          title: myController.text,
                                          deviceCount: 0));
                                      // clear text field
                                      myController.clear();
                                      // close bottomSheet
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Container(
                                    height: 64,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      gradient: const LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Color(0xFF356FDE),
                                          Color(0xFF00B4F0),
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        itemCount: listGroup.length,
        itemBuilder: (context, index) {
          return Slidable(
            // Specify a key if the Slidable is dismissible.
            key: const ValueKey(0),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(

                  onPressed: (BuildContext context) {},
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Rename',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child: GroupTile(
                title: listGroup[index].title,
                deviceCount: listGroup[index].deviceCount),
          );
          return GroupTile(
              title: listGroup[index].title,
              deviceCount: listGroup[index].deviceCount);
        },
      ),
    );
  }
}

class GroupTileModel {
  const GroupTileModel({required this.title, required this.deviceCount});

  final String title;
  final int deviceCount;
}

class GroupTile extends StatelessWidget {
  const GroupTile({required this.title, required this.deviceCount});

  final String title;
  final int deviceCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF2E334A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 42),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 38),
                      Container(
                        height: 64,
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF00B4F0), Color(0xFF356FDE)],
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF1F2439),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Name',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 42),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xFF393E57),
            ),
          ),
        ),
        child: SizedBox(
          width: 354,
          height: 76,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Nutito',
                )),
              ),
              Text(
                '$deviceCount device',
                style: const TextStyle(
                  color: Color(0xFF9293A4),
                  fontSize: 16,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
