import 'package:revirew/pages/camera_page.dart';
import 'package:revirew/pages/chat_page.dart';
import 'package:revirew/pages/status_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controllert;
  @override
  void initState() {
    super.initState();
    _controllert = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gamal"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton(
              onSelected: (index) => print("$index"),
              itemBuilder: (BuildContext context) => const [
                    PopupMenuItem(
                      child: Text("New Group"),
                      value: "New Group",
                    ),
                    PopupMenuItem(
                      child: Text("New broadcast"),
                      value: "New broadcast",
                    ),
                    PopupMenuItem(
                      child: Text("Whatsapp Web"),
                      value: "Whatsapp Web",
                    ),
                    PopupMenuItem(
                      child: Text("Started Message"),
                      value: "Started Message",
                    ),
                    PopupMenuItem(
                      child: Text("Settings"),
                      value: "Settings",
                    ),
                  ])
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controllert,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controllert,
        physics: const BouncingScrollPhysics(),
        children: [
          CameraPage(),
          ChatScreen(),
          StatusScreen(),
          ChatScreen(),
        ],
      ),
    );
  }
}



// IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.more_vert),
//           ),