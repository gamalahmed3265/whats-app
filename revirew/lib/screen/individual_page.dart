import 'package:revirew/CustomUI/own_massge_card.dart';
import 'package:revirew/CustomUI/replay_massege.dart';
import 'package:revirew/constent.dart';
import 'package:revirew/model/chat_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

import 'package:revirew/model/socket_in.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  IndividualPage({Key? key, required this.ListMaage}) : super(key: key);
  final ChatModel ListMaage;
  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  // late io.Socket socket;

  final ScoketClint _scoketClint = ScoketClint.instance;
  late IO.Socket socket;
  @override
  void initState() {
    super.initState();
    testConnect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  Future<void> testConnect()async {
    // _scoketClint.socket!.emit('test', 'this is working');
    //192.168.182.1
    //10.0.2.2
    try{
      socket =await IO.io(
          'http://192.168.182.1:3700/',<String,dynamic>{
            'transporst':["websocket"],
            'autoConnect':true
      });
      socket.connect();
      print(socket.connected);
      socket.onConnect((data){
        print("Connecttion : ${socket.id}");
      }
      );
      print("hhhhh");
    }catch(e){
      print(e);
    }
  }

  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/images/whats_back.png",
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: SvgPicture.asset(
                      widget.ListMaage.isGroup
                          ? "assets/icons/${widget.ListMaage.icon}"
                          : "assets/icons/groups_black_36dp.svg",
                      height: 36,
                      width: 36,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            title: InkWell(
              onTap: () => print("jjj"),
              child: Container(
                margin: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.ListMaage.name}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Last Seen Tody 12.5 Am",
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.videocam,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                ),
              ),
              PopupMenuButton(
                  onSelected: (index) => print("$index"),
                  itemBuilder: (BuildContext context) => const [
                        PopupMenuItem(
                          child: Text("View Contact"),
                          value: "View Contact",
                        ),
                        PopupMenuItem(
                          child: Text("Media ,Link and docs"),
                          value: "Media ,Link and docs",
                        ),
                        PopupMenuItem(
                          child: Text("Whatsapp Web"),
                          value: "Whatsapp Web",
                        ),
                        PopupMenuItem(
                          child: Text("Search"),
                          value: "Search",
                        ),
                        PopupMenuItem(
                          child: Text("Mute Notification"),
                          value: "Mute Notification",
                        ),
                        PopupMenuItem(
                          child: Text("Wallpaper"),
                          value: "Wallpaper",
                        ),
                      ])
            ],
          ),
          body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Container(
                  height: size.height - 140,
                  child: ListView(
                    children: [
                      OwnMassegeCard(),
                      ReplayMassegeCard(),
                      OwnMassegeCard(),
                      ReplayMassegeCard(),
                      OwnMassegeCard(),
                      ReplayMassegeCard(),
                      OwnMassegeCard(),
                      ReplayMassegeCard(),
                      OwnMassegeCard(),
                      ReplayMassegeCard(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: size.width - 55,
                              margin: const EdgeInsets.only(
                                  left: 2, right: 2, bottom: 8),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextFormField(
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                    focusNode: focusNode,
                                    autofocus: true,
                                    controller: _controller,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a Message",
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                        prefixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                              emojiShowing = !emojiShowing;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.emoji_emotions,
                                            color: accentColorg,
                                          ),
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (_) =>
                                                        bouttomSheet(size));
                                              },
                                              icon: const Icon(
                                                Icons.attach_file,
                                                color: accentColorg,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.camera_alt,
                                                color: accentColorg,
                                              ),
                                            ),
                                          ],
                                        ),
                                        contentPadding:
                                            const EdgeInsets.all(5)),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: CircleAvatar(
                              backgroundColor: accentColorg,
                              radius: 25,
                              child: IconButton(
                                onPressed: () => print("mic"),
                                icon: const Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      emojiShowing
                          ? Offstage(
                              offstage: !emojiShowing,
                              child: SizedBox(
                                  height: 250, child: emoji(_controller)),
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bouttomSheet(Size size) {
    return Container(
      width: size.width,
      height: 278,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1.2,
            ),
            children: [
              iconcreation(Icons.insert_drive_file, "Document", Colors.indigo),
              iconcreation(Icons.camera_alt, "Camera", Colors.pink),
              iconcreation(Icons.insert_photo, "Gallery", Colors.purple),
              iconcreation(Icons.headset, "Audio", Colors.orange),
              iconcreation(Icons.location_pin, "Location", Colors.green),
              iconcreation(Icons.person, "Contact", Colors.blueAccent),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, String text, Color color) {
    return InkWell(
      onTap: () => print("$text"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              color: Colors.white,
              size: 29,
            ),
          ),
          Text("${text}")
        ],
      ),
    );
  }
}

_onEmojiSelected(Emoji emoji, TextEditingController _controller) {
  _controller
    ..text += emoji.emoji
    ..selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
}

_onBackspacePressed(TextEditingController _controller) {
  _controller
    ..text = _controller.text.characters.skipLast(1).toString()
    ..selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));
}

Widget emoji(TextEditingController _controller) {
  return EmojiPicker(
      onEmojiSelected: (Category category, Emoji emoji) {
        _onEmojiSelected(emoji, _controller);
      },
      onBackspacePressed: _onBackspacePressed(_controller),
      config: Config(
          columns: 7,
          // Issue: https://github.com/flutter/flutter/issues/28894
          emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
          verticalSpacing: 0,
          horizontalSpacing: 0,
          initCategory: Category.RECENT,
          bgColor: const Color(0xFFF2F2F2),
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          progressIndicatorColor: Colors.blue,
          backspaceColor: Colors.blue,
          showRecentsTab: true,
          recentsLimit: 28,
          noRecentsText: 'No Recents',
          noRecentsStyle: const TextStyle(fontSize: 20, color: Colors.black26),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const CategoryIcons(),
          buttonMode: ButtonMode.MATERIAL));
}
