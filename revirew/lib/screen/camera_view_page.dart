import 'dart:io';

import 'package:camera/camera.dart';
import 'package:revirew/CustomUI/const_fun.dart';
import 'package:revirew/constent.dart';
import 'package:revirew/screen/individual_page.dart';
import 'package:flutter/material.dart';

class CameraViewPage extends StatefulWidget {
  CameraViewPage({Key? key, required this.image}) : super(key: key);
  final XFile image;

  @override
  State<CameraViewPage> createState() => _CameraViewPageState();
}

class _CameraViewPageState extends State<CameraViewPage> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBarEdit(() {
          setState(() {
            focusNode.unfocus();
            focusNode.canRequestFocus = false;
            emojiShowing = !emojiShowing;
          });
        }),
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                child: Image.file(
                  File(widget.image.path),
                  fit: BoxFit.fill,
                ),
              ),
              TextFromFill(size, _controller, focusNode, emojiShowing)
            ],
          ),
        ));
  }
}
