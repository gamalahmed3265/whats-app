import 'package:revirew/CustomUI/custom_car.dart';
import 'package:revirew/model/chat_model.dart';
import 'package:revirew/screen/select_contect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chatlist = [
    ChatModel(
        name: "Dev Stack",
        isGroup: true,
        time: "9:10 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Hi Everyone"),
    ChatModel(
        name: "Mohamed",
        isGroup: false,
        time: "2:34 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Hi Everyone"),
    ChatModel(
        name: "Gamal",
        isGroup: false,
        time: "9:10 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Slam Alic"),
    ChatModel(
        name: "Zenab",
        isGroup: false,
        time: "12:54 AM",
        icon: "person_black_36dp.svg",
        currentmessge: "Yawolllaa"),
    ChatModel(
        name: "Dev Stack",
        isGroup: false,
        time: "9:10 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Hi Everyone"),
    ChatModel(
        name: "Saeed",
        isGroup: false,
        time: "12:23 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Play Football"),
    ChatModel(
        name: "Dev Stack",
        isGroup: true,
        time: "9:10 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Hi Everyone"),
    ChatModel(
        name: "Mohamed",
        isGroup: false,
        time: "2:34 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Hi Everyone"),
    ChatModel(
        name: "Gamal",
        isGroup: false,
        time: "9:10 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Slam Alic"),
    ChatModel(
        name: "Zenab",
        isGroup: false,
        time: "12:54 AM",
        icon: "person_black_36dp.svg",
        currentmessge: "Yawolllaa"),
    ChatModel(
        name: "Dev Stack",
        isGroup: false,
        time: "9:10 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Hi Everyone"),
    ChatModel(
        name: "Saeed",
        isGroup: false,
        time: "12:23 PM",
        icon: "person_black_36dp.svg",
        currentmessge: "Play Football"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SelectContact())),
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: chatlist.length,
          itemBuilder: (context, index) => CustomCard(
                customCardlist: chatlist[index],
              )),
    );
  }
}
