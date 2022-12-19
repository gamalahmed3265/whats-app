import 'package:revirew/constent.dart';
import 'package:revirew/model/chat_model.dart';
import 'package:revirew/screen/individual_page.dart';
import 'package:revirew/screen/photp_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.customCardlist}) : super(key: key);
  final ChatModel customCardlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => IndividualPage(
                ListMaage: customCardlist,
              ))),
      child: Column(
        children: [
          ListTile(
            leading: InkWell(
              onTap: () {
                showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: CupertinoAlertDialogFun,
                );
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  customCardlist.isGroup
                      ? "assets/icons/${customCardlist.icon}"
                      : "assets/icons/groups_black_36dp.svg",
                  height: 37,
                  width: 37,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              "${customCardlist.name}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "${customCardlist.currentmessge}",
                ),
              ],
            ),
            trailing: Text(
              "${customCardlist.time}",
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 80, right: 20),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget CupertinoAlertDialogFun(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        width: 100,
        height: 300,
        color: Colors.white,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => PhotoProfile()));
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2021/09/03/15/14/woman-6596029_1280.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    color: Colors.black.withOpacity(0.4),
                    child: Text(
                      "${customCardlist.name}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => print("object"),
                      icon: const Icon(
                        Icons.chat,
                        color: accentColorg,
                      ),
                    ),
                    IconButton(
                      onPressed: () => print("object"),
                      icon: const Icon(
                        Icons.call,
                        color: accentColorg,
                      ),
                    ),
                    IconButton(
                      onPressed: () => print("object"),
                      icon: const Icon(
                        Icons.video_call,
                        color: accentColorg,
                      ),
                    ),
                    IconButton(
                      onPressed: () => print("object"),
                      icon: const Icon(
                        Icons.error_outline,
                        color: accentColorg,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
