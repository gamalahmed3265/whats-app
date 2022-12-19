import 'package:revirew/CustomUI/list_tile_wedget.dart';
import 'package:revirew/constent.dart';
import 'package:revirew/model/chat_model.dart';
import 'package:revirew/screen/create_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> chatlist = [
    ChatModel(
      name: "Dev Stack",
      status: "Hi Everyone",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Mohamed",
      status: "Hi Everyone",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Gamal",
      status: "Slam Alic",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Zenab",
      status: "Yawolllaa",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Dev Stack",
      status: "Hi Everyone",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Saeed",
      status: "Play Football",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Dev Stack",
      status: "Hi Everyone",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Mohamed",
      status: "Hi Everyone",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Gamal",
      status: "Slam Alic",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Zenab",
      status: "Yawolllaa",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Dev Stack",
      status: "Hi Everyone",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Saeed",
      status: "Play Football",
      icon: "person_black_36dp.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: ListTile(
          title: const Text(
            "Select Contact",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          subtitle: Text(
            "${chatlist.length} Contact",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(
              onSelected: (value) => print(value),
              itemBuilder: (BuildContext context) => const [
                    PopupMenuItem(
                      child: Text("Invite a friend"),
                      value: "Invite a friend",
                    ),
                    PopupMenuItem(
                      child: Text("Contect"),
                      value: "Contect",
                    ),
                    PopupMenuItem(
                      child: Text("Refresh"),
                      value: "Refresh",
                    ),
                    PopupMenuItem(
                      child: Text("help"),
                      value: "help",
                    ),
                  ])
        ],
      ),
      body: ListView.builder(
          itemCount: chatlist.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ListTileWedget(
                  name: "New group",
                  icon: "groups_black_36dp.svg",
                  color: accentColorg,
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ContectContact())));
            } else if (index == 1) {
              return ListTileWedget(
                  name: "New Contect",
                  icon: "groups_black_36dp.svg",
                  color: accentColorg,
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ContectContact())));
            }
            return ListTileWedget(
              name: chatlist[index - 2].name,
              icon: chatlist[index - 2].icon,
              status: chatlist[index - 2].status,
              onPressed: () => print(chatlist[index - 2].name),
            );
          }),
    );
  }
}
