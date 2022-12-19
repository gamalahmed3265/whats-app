import 'package:revirew/CustomUI/custom_car.dart';
import 'package:revirew/model/chat_model.dart';
import 'package:revirew/screen/camera_screen.dart';
import 'package:revirew/screen/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<ChatModel> chatlist = [
    ChatModel(
      name: "Dev Stack",
      time: "9:10 PM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Mohamed",
      time: "2:34 PM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Gamal",
      time: "9:10 PM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Zenab",
      time: "12:54 AM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Dev Stack",
      time: "9:10 PM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Saeed",
      time: "12:23 PM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Dev Stack",
      time: "9:10 PM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Mohamed",
      time: "2:34 PM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Gamal",
      time: "9:10 PM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Zenab",
      time: "12:54 AM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Dev Stack",
      time: "9:10 PM",
      icon: "person_black_36dp.svg",
    ),
    ChatModel(
      name: "Saeed",
      time: "12:23 PM",
      icon: "person_black_36dp.svg",
    ),
  ];
  String videSrc =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatlist.length,
          itemBuilder: (context, index) => ListTileStatus(context, index)),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.grey[50],
            mini: true,
            onPressed: () => print("object"),
            child: const Icon(
              Icons.create,
              color: Colors.blueGrey,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => CmaeraScreen())),
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }

  ListTile ListTileStatus(BuildContext context, int index) {
    return ListTile(
      // onTap: () => Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (_) => VideoPlayerApp(videSrc: videSrc,))),
      title: Text(chatlist[index].name),
      subtitle: Text(chatlist[index].time),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blueGrey,
        child: SvgPicture.asset(
          "assets/icons/groups_black_36dp.svg",
          height: 37,
          width: 37,
          color: Colors.white,
        ),
      ),
    );
  }
}
