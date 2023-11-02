import 'package:flutter/material.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    List<String> dataList = ['Row 1', 'Row 2']; // Sample data for the list

    return Scaffold(
      backgroundColor: const Color(0xFF1F2439),
      appBar: AppBar(
        title: const Text(
          'Groups',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 32.74 / 24,
            letterSpacing: 0.1,
          ),
        ),
        backgroundColor: const Color(0xFF1F2439),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                backgroundColor: const Color(0xFF2E334A),
                builder: (BuildContext context) {
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Groups add',
                            textAlign: TextAlign.center, // Align text to center
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: 354,
                            height: 64,
                            margin: const EdgeInsets.only(left: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(width: 1.0, color: const Color(0xFF1F2439)),
                              color: const Color(0xFF1F2439),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: TextField(
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Name',
                                  hintStyle: const TextStyle(color: Color(0xF9293A4),fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            width: 354,
                            height: 64,
                            margin: const EdgeInsets.only(left: 18),
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
                                style: TextStyle(color: Colors.white,fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              GroupTile(title: 'Thai Nguyen', deviceCount: 10),
              GroupTile(title: 'Nha Trang', deviceCount: 6),
              GroupTile(title: 'Da Nang', deviceCount: 3),
              GroupTile(title: 'Phu Quoc', deviceCount: 15),
            ],
          );
        },
      ),
    );
  }
}
class GroupTile extends StatelessWidget {
  const GroupTile({required this.title, required this.deviceCount});
  final String title;
  final int deviceCount;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFF393E57)),
          bottom: BorderSide(width: 1.0, color: Color(0xFF393E57)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 24)),
          Text('$deviceCount device' , style: TextStyle(color: Color(0x0f9293a4), fontSize: 16)),
        ],
      )
    );
  }
}
