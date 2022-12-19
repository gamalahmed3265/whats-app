import 'package:revirew/constent.dart';
import 'package:revirew/screen/camera_view_page.dart';
import 'package:revirew/screen/individual_page.dart';
import 'package:flutter/material.dart';

AppBar AppBarEdit(VoidCallback onpress) {
  return AppBar(
    backgroundColor: Colors.black,
    actions: [
      IconButton(
          onPressed: () => print("jjj"),
          icon: const Icon(
            Icons.crop_rotate,
            size: 27,
          )),
      IconButton(
          onPressed: onpress,
          icon: const Icon(
            Icons.emoji_emotions_outlined,
            size: 27,
          )),
      IconButton(
          onPressed: () => print("jjj"),
          icon: const Icon(
            Icons.title,
            size: 27,
          )),
      IconButton(
          onPressed: () => print("jjj"),
          icon: const Icon(
            Icons.edit,
            size: 27,
          )),
    ],
  );
}

Align TextFromFill(Size size, TextEditingController _controller,
    FocusNode focusNode, bool emojiShowing) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ContaierTextEditMoth(
            size: size, controller: _controller, focusNode: focusNode),
        emojiShowing
            ? Offstage(
                offstage: !emojiShowing,
                child: SizedBox(height: 250, child: emoji(_controller)),
              )
            : Container(),
      ],
    ),
  );
}

Widget ContaierTextEditMoth({
  required Size size,
  required TextEditingController controller,
  required FocusNode focusNode,
}) {
  return Container(
    width: size.width,
    child: Row(
      children: [
        Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextFormField(
                cursorColor: accentColorg,
                focusNode: focusNode,
                autofocus: true,
                controller: controller,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: IconButton(
                      onPressed: () => print("object"),
                      icon: const Icon(
                        Icons.collections_rounded,
                        color: Colors.blueGrey,
                        size: 25,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => print("object"),
                      icon: const Icon(
                        Icons.error_rounded,
                        color: Colors.blueGrey,
                        size: 25,
                      ),
                    ),
                    hintText: "Add a Caption...",
                    hintStyle: const TextStyle(color: Colors.black)),
              ),
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => print("object"),
              child: const CircleAvatar(
                  backgroundColor: accentColorg,
                  radius: 25,
                  child: Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.white,
                  )),
            ))
      ],
    ),
  );
}
