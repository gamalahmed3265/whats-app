import 'package:revirew/CustomUI/list_tile_wedget.dart';
import 'package:revirew/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContectContact extends StatefulWidget {
  ContectContact({Key? key}) : super(key: key);

  @override
  _ContectContactState createState() => _ContectContactState();
}

class _ContectContactState extends State<ContectContact> {
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
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const ListTile(
          title: Text(
            "Create Group",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          subtitle: Text(
            "Add Participants",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: chatlist.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return ListTile(
                  onTap: () {
                    if (chatlist[index - 1].isSelect == false) {
                      setState(() {
                        chatlist[index - 1].isSelect = true;
                        groups.add(chatlist[index - 1]);
                      });
                    } else {
                      setState(() {
                        chatlist[index - 1].isSelect = false;
                        groups.remove(chatlist[index - 1]);
                      });
                    }
                  },
                  title: Text("${chatlist[index - 1].name}"),
                  subtitle: Text("${chatlist[index - 1].status}"),
                  leading: Container(
                    height: 53,
                    width: 50,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blueGrey[200],
                          radius: 25,
                          child: SvgPicture.asset(
                            "assets/icons/${chatlist[index - 1].icon}",
                            height: 37,
                            width: 37,
                            color: Colors.white,
                          ),
                        ),
                        chatlist[index - 1].isSelect
                            ? const Positioned(
                                bottom: 4,
                                right: 5,
                                child: CircleAvatar(
                                  radius: 11,
                                  backgroundColor: Colors.teal,
                                  child: Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                );
              }),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: groups.length,
                          itemBuilder: (context, index) {
                            if (groups[index].isSelect == true) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      groups[index].isSelect = false;
                                      groups.remove(groups[index]);
                                    });
                                  },
                                  child:
                                      RowCreateGroups(groups: groups[index]));
                            } else
                              return Container();
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}

class RowCreateGroups extends StatelessWidget {
  const RowCreateGroups({
    Key? key,
    required this.groups,
  }) : super(key: key);

  final ChatModel groups;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            height: 53,
            width: 50,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey[200],
                  radius: 25,
                  child: SvgPicture.asset(
                    "assets/icons/${groups.icon}",
                    height: 37,
                    width: 37,
                    color: Colors.white,
                  ),
                ),
                const Positioned(
                  bottom: 2,
                  right: 3,
                  child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.clear_rounded,
                        size: 18,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
          Text("${groups.name}")
        ],
      ),
    );
  }
}
